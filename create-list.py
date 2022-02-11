#!/usr/bin/env python3

import requests, redis

url = "https://www.sec.gov/files/EDGAR_LogFileData_thru_Jun2017.html"
file = requests.get(url).text.split('\r\n')
lst = [i.strip() for i in file][8:-2]
lst.sort()

# Create work queue:
r = redis.Redis(host='localhost', port=6379)
for item in lst:
    r.sadd('setList', item)

#with open('url_list.txt', 'w') as f:
#    for item in lst:
#        f.write(f'{item} \\\n')
