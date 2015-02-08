FROM ubuntu:14.04

RUN apt-get update -qq
RUN apt-get install -y socat git software-properties-common python-software-properties postgresql-client-9.3 postgresql-client-common

RUN apt-get update -qq
RUN apt-get install -y python-pip python-psycopg2 libpq-dev python2.7-dev gunicorn libmagic1

RUN mkdir -p /usr/src
COPY . /usr/src/
RUN pip install -r /usr/src/requirements.txt

WORKDIR /usr/src/app
EXPOSE 5000
