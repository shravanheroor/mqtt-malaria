FROM python:2
# migration to pypy ?

WORKDIR /root/
RUN apt update && apt install -y python-setuptools fuse

RUN mkdir mqtt-malaria
ADD . /root/mqtt-malaria
WORKDIR /root/mqtt-malaria

RUN python setup.py build
RUN python setup.py install