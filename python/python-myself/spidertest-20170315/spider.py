# -*- coding: utf-8 -*-
"""
Created on Wed Mar 15 22:45:00 2017
@author: yansenxu

spider.py
今日头条美图抓取
"""
#索引页请求
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



def get_page_index(offset,keyword):
    data={
            'offset':offset,
            'format':'json',
            'keyword':keyword,
            'autoload':'true',
            'count':'20',
            'cur_tab':1,
    }#索引页参数，构造为字典
    url='https://www.toutiao.com/search_content/?'+urlencode(data)
    #利用url库提高的编码方法将参数加入到url中去
    try:
        response=requests.get(url)#request请求获取索引页的内容
        if response.status_code==200:
            return response.text#如果返回的200,证明成功则返回 
        return None#如果不正确返回none
    except ConnectionError:
        print('请求索引页出错')
        return None
            
#def获取索引页内容
def parse_page_index(html):
    data=json.loads(html)#将json字符串转化为对象
    if data and 'data' in data.keys():#判断json数据含有data这个属性
        for item in data.get('data'):
            yield item.get('article_url')#yield构造一个生成器，将article_url提取出来

#def获取索引页指向的url信息，获取后面要用的每个页面的url
def get_page_detail(url):
    try:
        response=requests.get(url)#request请求获取索引页的内容
        if response.status_code==200:
            return response.text#如果返回的200,证明成功则返回
        return None#如果不正确返回none
    except ConnectionError:
        print('请求索引页出错')
        return None
#def 将详情页的url提取出来
def parse_page_detail(html,url):
	soup=BeautifulSoup(html,'lxml')#利用beautifulsoup4解析title,信息包含在原始html
    	title=soup.select('title')[0].get_text()
	print(title)
	images_pattern=re.compile('var gallery=(.*?);',re.S)#定义正则表达式提取url
	result=re.search(images_pattern,html)#利用re.search方法传入正则表达式的对象
	if result:
	    data = json.load(result.group(1))
	    if data and 'sub_images' in data.keys():
		  sub_images = data.get('sub_images')
		  images=[item.get('url') for item in sub_images]
		  return {控制栏背景
播放
普屏
音量打开
00:29:17/00:40:21
logo
大播放按钮
天善学院 2017 年 SVIP 会员募集计划热力来袭！ 播放速度  学过了
课程目录提问讲师
1 . 分析Ajax抓取今日头条街拍美图40:21
2 . Requests+正则表达式抓取猫眼电影TOP100
			'title':title,
			'url':url,
			'images':images
		  }
#def解析url的详细内容
控制
def main():
    html=get_page_index(40,'街拍')
    for url in parse_page_index(html):#经过这个函数将url提出
        html=get_page_detail(url)#调用函数对详情页的url进行提取
	  if html:
		result=parse_page_detail(html,url)
		print(result)

if __name__=='__main__':
    main()
    
            
    


