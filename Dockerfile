FROM python:3.8-slim-buster

RUN apt-get update \
 && apt-get install wget -y

WORKDIR /app

COPY api/* /app
COPY requirements.txt /app
COPY docker-entrypoint.sh /
RUN chmod u+x ../docker-entrypoint.sh
RUN pip install -r requirements.txt

ENTRYPOINT ["bash", "../docker-entrypoint.sh"]



#  wget github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.gz
# tar -zxf pcre2-10.42.tar.gz
# cd pcre2-10.42
# ./configure
# make
# sudo make install