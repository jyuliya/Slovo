FROM ubuntu:16.04
MAINTAINER Yuliya Reneva <yudreneva@edu.hse.ru>
RUN apt-get update
RUN apt-get install
RUN echo 'I love Jenkins'
EXPOSE 80