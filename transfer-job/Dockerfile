FROM python:3.8
ADD transfer-job-v1.1.py /
RUN pip install argparse requests redis
RUN mkdir /log-files
CMD [ "python3", "transfer-job-v1.1.py", "-s",  "/log-files" ]
