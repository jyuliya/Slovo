from bs4 import BeautifulSoup
import requests


for i in range (0, 32):
    if ((i == 26) | (i == 28)):
        continue
    a = hex(16*9+i)
    b = str(a)
    b = b[-2:]
    stop = True
    count = 0
    while (stop):
        count += 1
        r = requests.get('http://slovonovo.ru/character/%D0%' + b + '?page=' + str(count))
        soup = BeautifulSoup(r.text, 'html.parser')
        for link in soup.find_all('div'):
            c = str(link.get("class"))
            if (c == "['col25']"):
                title = link.text.split('\n')
                link1 = str(link).split('\n')
                counting = 0
                for elem in link1:
                    counting += 1
                    elem1 = elem.split('"')
                    if (elem1[1] == 'col25'):
                        counting -= 1
                        continue
                    with open('text.json', 'a') as file:
                        print()
                        print('"', title[counting], '" : {')
                    r1 = requests.get('http://slovonovo.ru' + elem1[1])
                    soup1 = BeautifulSoup(r1.text, 'html.parser')
                    print('\t"definition" : "', end = '')
                    print(soup1('p')[3].text[22:], end = '')
                    print('"},')
                    print('\t"example" : "', end = '')
                    print(soup1('p')[4].text, end= '')
                    print('"},')
        if (soup.find('span') == None):
            count = 0
            stop = False
            break
        for link in soup.find_all('span'):
            c = str(link.get("class"))
            if ((c == "['arr', 'disabled']") & (link.text[2:] != "предыдущая")) :
                stop = False
                count = 0