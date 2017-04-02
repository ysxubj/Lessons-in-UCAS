import json
import os
from urllib.parse import urlencode
import pymongo
import requests
from bs4 import BeautifulSoup
from requests.exceptions import ConnectionError
import re
from multiprocessing import Pool
from hashlib import md5
from json.decoder import JSONDecodeError
from config import *

client = pymongo.MongoClient(MONGO_URL, connect=False)
db = client[MONGO_DB]


def get_page_index(offset, keyword):#获取首页信息
    data = {
        'autoload': 'true',
        'count': 20,
        'cur_tab': 3,
        'format': 'json',
        'keyword': keyword,
        'offset': offset,
    }
    params = urlencode(data)
    base = 'http://www.toutiao.com/search_content/'
    url = base + '?' + params
    try:
        response = requests.get(url)
        if response.status_code == 200:
            return response.text
        return None
    except ConnectionError:
        print('Error occurred')
        return None


def download_image(url):#下载图片
    print('Downloading', url)
    try:
        response = requests.get(url)
        if response.status_code == 200:
            save_image(response.content)#存储图的索引舍respose.content,请求图片，请求网页用的是text
        return None
    except ConnectionError:
        print('请求图片出错',url)
        return None


def save_image(content):#存为图片
    file_path = '{0}/{1}.{2}'.format(os.getcwd(), md5(content).hexdigest(), 'jpg')#路径/文件名.后缀，md5()如果内容相同那么md5值就相同
    print(file_path)
    if not os.path.exists(file_path):
        with open(file_path, 'wb') as f:
            f.write(content)
            f.close()


def parse_page_index(text):
    try:
        data = json.loads(text)
        if data and 'data' in data.keys():
            for item in data.get('data'):
                yield item.get('article_url')
    except JSONDecodeError:
        pass


def get_page_detail(url):#获得url中的详细信息
    try:
        response = requests.get(url)
        if response.status_code == 200:
            return response.text
        return None
    except ConnectionError:
        print('Error occurred')
        return None


def parse_page_detail(html, url):#解析详情页的方法
    soup = BeautifulSoup(html, 'lxml')#title信息提取
    result = soup.select('title')
    title = result[0].get_text() if result else ''
    images_pattern = re.compile('var gallery = (.*?);', re.S)#图片信息
    result = re.search(images_pattern, html)#传入正则表达式的对象，然后search一下
    if result:
        data = json.loads(result.group(1))#将1中的结果取出
        if data and 'sub_images' in data.keys():
            sub_images = data.get('sub_images')
            images = [item.get('url') for item in sub_images]
            for image in images: download_image(image)
            return {
                'title': title,
                'url': url,
                'images': images
            }


def save_to_mongo(result):#将数据存到mongdb中
    if db[MONGO_TABLE].insert(result):
        print('Successfully Saved to Mongo', result)
        return True
    return False


def main(offset):
    text = get_page_index(offset, KEYWORD)
    urls = parse_page_index(text)
    for url in urls:
        html = get_page_detail(url)
        result = parse_page_detail(html, url)
        if result: save_to_mongo(result)


pool = Pool()
groups = ([x * 20 for x in range(GROUP_START, GROUP_END + 1)])
pool.map(main, groups)
pool.close()
pool.join()
