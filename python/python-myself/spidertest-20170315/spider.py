# -*- coding: utf-8 -*-
"""
Created on Wed Mar 15 22:45:00 2017
@author: yansenxu

spider.py
今日头条美图抓取
"""
#索引页请求
from urllib.parse import urlencode

import beautifulsoup4 as beautifulsoup4
from requests.exceptions import RequestException
import requests
import json#安装json这个包
import re

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
        response=requests.get(url)
        if response.status_code==200:
            return response.text#如果返回的200,证明成功则返回 
        return None#如果不正确返回none
    except RequestException:
        print('请求索引页出错')
        return None
            
            #获取索引页内容完成
def parse_page_index(html):
    data=json.loads(html)#将json字符串转化为对象
    if data and 'data' in data.keys():#判断json数据含有data这个属性
        for item in data.get('data'):
            yield item.get('article_url')#yield构造一个生成器，将article_url提取出来
#获取索引页指向的url信息，获取后面要用的每个页面的url
        
def get_page_detail(url):
    try:
	  response = requests.get(url)
	  if response.status_code == 200:
		return response.text  # 如果返回的200,证明成功则返回
	  return None  # 如果不正确返回none
    except RequestException:
	  print('请求索引页出错',url)
	  return None #将详情页的url提取出来
def parse_page_detail(html):
	soup=beautifulsoup4(html,'lxml')#利用beautifulsoup4解析title
    	title=soup.select('title')[0].get_text()#title为soup.select中的文本信息
	print(title)
	images_pattern=re.compile('var gallery=(.*?);',re.S)#定义正则表达式提取url
	result=re.search(images_pattern,html)#利用re.search方法传入
	if result:
	    print(result.group(1))
#解析url
def main():
    html=get_page_index(40,'街拍')
    for url in parse_page_index(html):#经过这个函数将url提出
        html=get_page_detail(url)#调用函数对详情页的url进行提取
	  if html:
		parse_page_detail(html)



if __name__=='__main__':
    main()
    
            
    


