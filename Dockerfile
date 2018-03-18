FROM nginx

MAINTAINER Big ART <tassanai.yeeton@gmail.com>

EXPOSE 8080
EXPOSE 443

RUN echo "Asia/Bangkok" > /etc/timezone
RUN echo "Asia/Bangkok" > /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

ADD ./config/nginx.conf /etc/nginx/nginx.conf
ADD ./config/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir /etc/nginx/ssl

WORKDIR /etc/nginx/ssl
ADD ./config/ .

ADD ./demo.html /usr/share/nginx/html/index.html
ADD ./demo.html /usr/share/nginx/html/demo.html
RUN mkdir /usr/share/nginx/html/res
RUN mkdir /usr/share/nginx/html/res/img
RUN mkdir /usr/share/nginx/html/res/img2

ADD ./res/img /usr/share/nginx/html/res/img
ADD ./res/img2 /usr/share/nginx/html/res/img2
