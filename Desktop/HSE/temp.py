#!/usr/bin/env python
#coding : utf8

from bs4 import BeautifulSoup
import requests

import json


for i in range (27, 28):
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
                        #print('"', title[counting], '" : {')
                        #json.dump('"', file)
                        #json.dump(title[counting], file)
                        #json.dump('" : {', file)
                        #file.close()
                    r1 = requests.get('http://slovonovo.ru' + elem1[1])
                    soup1 = BeautifulSoup(r1.text, 'html.parser')
                    with open('text.json', 'a') as file:
                        #print('"definition" : "', end = '')
                        #json.dump('"definition" : "', file)
                        file.close()
                    for link1 in soup1.find_all('p'):
                        if (link1.text[11:] != "Приходилось "):
                            with open('text.json', 'a') as file:
                                title1 = link1.text.split('\n')
                                #if (len(title1) != link1.text.count('\n') + 1):
                                    #print("bad")
                                for elem in title1:
                                    elem.replace('\r', '')
                                    elem.replace('\\', '')
                                    elem.strip('\r')
                                    print(''.join(i for i in elem if ord(i)<128))
                                    json.dump(json.dump(elem, file), file)
                                    if (len(elem) > 2):
                                        print()
                                        #print(elem, end='')
                                        #json.dump(elem, file)
                            file.close()
                    with open('text.json', 'a') as file:
                        print()
                        #print('"},')
                        #json.dump('"},\n', file)
                        file.close()
        if (soup.find('span') == None):
            count = 0
            stop = False
            break
        for link in soup.find_all('span'):
            c = str(link.get("class"))
            if ((c == "['arr', 'disabled']") & (link.text[2:] != "предыдущая")) :
                stop = False
                count = 0
        