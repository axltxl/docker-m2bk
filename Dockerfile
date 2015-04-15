FROM python:3.3


MAINTAINER Dave J. Franco <dave.franco@blanclink.com>

RUN apt-get update && apt-get upgrade -y

#Install container essentials
RUN apt-get install -y tar \
                   git \
                   curl \
                   nano \
                   wget \
                   dialog \
                   net-tools \
                   build-essential

#Install mongodb-tools
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org-tools

#Install m2bk
RUN pip install m2bk

VOLUME ["/dev/log"]

#Add m2bk configuration file
ADD m2bk.yaml /etc/m2bk.yaml

CMD ["m2bk", "-sc", "/etc/m2bk.yaml"]

