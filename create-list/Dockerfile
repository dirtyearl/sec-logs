FROM python:3.8
ADD create-list-v1.0.py /
RUN pip install requests redis argparse
CMD [ "python3", "create-list-v1.0.py", "--url", "https://www.sec.gov/files/EDGAR_LogFileData_thru_Jun2017.html" ]
