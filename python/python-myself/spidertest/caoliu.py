import requests
from requests import RequestException
import re

def get_one_page(url):
    try:
      response = requests.get(url)
      if response.status_code == 200:
        return response.text
      return None
    except RequestException:
      return None

def parse_one_page(html):#获取详情页
    pattern= re.compile('href="(.*?)"', re.S)
    items=re.findall(pattern,html)
    return items

def main(offset):
    url= "https://t66y.com/thread0806.php?fid=2&search=&page="+str(offset)
    html=get_one_page(url)
    parse_one_page(html)
    for item in parse_one_page(html):
        print(item)


if __name__=='__main__':
    main(1)
