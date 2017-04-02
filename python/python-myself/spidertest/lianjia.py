import requests
from requests import RequestException
from multiprocessing import Pool
import re

def get_one_page(url):
    try:
      response = requests.get(url)
      if response.status_code == 200:
        return response.text
      return None
    except RequestException:
      return None

def parse_one_page(html):
    pattern= re.compile('<dd>.*?board-index.*?>(\d+)</i>.*?data-src="(.*?)".*?name"><a'
                         +'.*?>(.*?)</a>.*?star">(.*?)</p>.*?releasetime">(.*?)</p>'
                         +'.*?integer">(.*?)</i>.*?fraction">(.*?)</i>.*?</dd>', re.S)
    items=re.findall(pattern,html)
    for item in items:
        yield {
            'index':item[0],
            'image':item[1],
            'title':item[2],
            'actor':item[3].strip()[3:],
            'time':item[4].strip()[5:],
            'score':item[5]+item[6]
        }







def main(offset):
    url = "http://bj.lianjia.com/ershoufang/dongcheng/pg{}".format(str(offset))
    #url = 'http://bj.lianjia.com/ershoufang/{}/pg{}/'.format(response.meta["id2"], str(1))
    html = get_one_page(url)
    print(html)

if __name__ == "__main__":
    pool = Pool()
    pool.map(main,[2])
