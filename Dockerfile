FROM ubuntu:18.04

LABEL maintainer="matthew.saner@nyu.edu"

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV FLASK_RUN_PORT=8080
ENV FLASK_RUN_HOST=0.0.0.0

RUN mkdir /app
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
RUN pip3 install -r requirements.txt

ADD . /app
EXPOSE 8080

CMD python3 -m flask run
