from bs4 import BeautifulSoup
import requests

for i in range (33):
    r = requests.get('http://teenslang.su/content/%D0%9' + str(i))
    soup = BeautifulSoup(r.text, 'html.parser')
    for link in soup.find_all("span"):
        if ((str(link.get("itemprop")) == "term") | (str(link.get("itemprop")) == "definition")):
            print(link.text)