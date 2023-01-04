FROM python:3
ADD transfer-job.py /
RUN pip install requests
RUN mkdir log-files
CMD [ "transfer-job.py", "-s",  "log-files", "--url", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030101.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030102.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030103.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030104.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030105.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030106.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030107.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030108.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030109.zip", "www.sec.gov/dera/data/Public-EDGAR-log-file-data/2003/Qtr1/log20030110.zip" ]
