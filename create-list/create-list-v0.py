import requests

url = "https://www.sec.gov/files/EDGAR_LogFileData_thru_Jun2017.html"
file = requests.get(url).text.split('\r\n')
lst = [i.strip() for i in file][8:-2]
lst.sort()

with open('url_list.txt', 'w') as f:
    for item in lst:
        f.write(f'{item} \\\n')
