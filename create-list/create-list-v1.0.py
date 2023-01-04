#!/usr/bin/env python3

import os, requests, redis, argparse

parser = argparse.ArgumentParser(
    prog='create-list',
    description='Download and convert to a list a document containing the SEC log file names',
    prefix_chars='-')
parser.add_argument('-u', '--url',
    help="Url for the html list of SEC log files",
    required=True)

#url = "https://www.sec.gov/files/EDGAR_LogFileData_thru_Jun2017.html"
url = parser.parse_args().url
file = requests.get(url).text.split('\r\n')
lst = [i.strip() for i in file][8:-2]

# Create work queue as a set of values in the redis database:
#host = 'redis'
host = os.getenv("REDIS_SERVICE_HOST")
r = redis.Redis(host=host, port=6379)
for item in lst:
    r.sadd('setList', item)
