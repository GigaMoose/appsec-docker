FROM ubuntu:18.04

LABEL maintainer="matthew.saner@nyu.edu"

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip

#RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV FLASK_RUN_PORT=8080
ENV FLASK_RUN_HOST=0.0.0.0

# We copy just the requirements.txt first to leverage Docker cache
RUN mkdir /app
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
#COPY Pip* /app/

#RUN . /opt/venv/bin/activate && pip install pipenv && pip install -r requirements.txt && pipenv install --dev --system --deploy --ignore-pipfile
RUN pip3 install -r requirements.txt



#COPY . /app
ADD . /app
#ENTRYPOINT [ "python" ]
EXPOSE 8080
#CMD [ "app.py" ]

CMD python3 -m flask run
