#!/usr/bin/env python3

import argparse, requests, redis

def download_url(url, chunk_size=128, save_path='./tmp'):
    r = requests.get(url, stream=True)
    name = url.split('/')[-1]
    save_path += '/' + name
    with open(save_path, 'wb') as fd:
        for chunk in r.iter_content(chunk_size=chunk_size):
            fd.write(chunk)
    return save_path

if __name__ == "__main__":
    r = redis.Redis(host='localhost', port=6379)
    parser = argparse.ArgumentParser(
        prog='download_url',
        description='Download a file and write to a directory',
        prefix_chars='-')
    parser.add_argument('-u', '--url', 
        help="Abbreviated url for SEC log file")
    parser.add_argument('-c', '--chunk-size',
        type=int, default=128, dest='chunk_size',
        help="File chunk size in iteration")
    parser.add_argument('-s', '--save-path', 
        default='./tmp', dest='save_path',
        help="Path for the zip file associated with the url")
    args = parser.parse_args()

    #url = args.url
    #lst = args.url

    def func(url): return download_url('http://' + url, args.chunk_size, args.save_path)
    lst = r.spop('setList', 10)
    for u in lst:
        print(func(u))
        
