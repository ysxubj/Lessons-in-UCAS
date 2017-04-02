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

def main(offset):
    url= "https://t66y.com/thread0806.php?fid=2&search=&page="+str(offset)
    html=get_one_page(url)
    print(html)

if __name__=='__main__':
    main(1)
