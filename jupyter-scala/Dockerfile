# Jupyter Notebook with jupyter-scala using Java8, Python 3 running on Debian Jessie
FROM openjdk:8

# openjdk:8 avaiable on https://hub.docker.com/_/openjdk/

MAINTAINER "João Antonio Ferreira" <joao.parana@gmail.com>`

ENV REFRESHED_AT 2016-12-06

RUN apt-get update \
 && apt-get install -y \
    curl \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install jupyter

RUN curl -L -o jupyter-scala https://git.io/vzhRi \
 && chmod +x jupyter-scala \
 && ./jupyter-scala \
 && rm -f jupyter-scala

# Notebook Configuration
ENV NBCONFIG /root/.jupyter/nbconfig
RUN mkdir -p $NBCONFIG \
 && { echo '{"CodeCell":{"cm_config":'; \
      echo '{"indentUnit":2,"smartIndent":false}'; \
      echo '}}'; \
    } > /$NBCONFIG/notebook.json

# bootstrap.py will set pasword on /root/.jupyter/jupyter_notebook_config.py 
# based on JUPYTER_PASSWORD environment variable and will set open-browser too
COPY bootstrap.py /bootstrap.py

COPY install/pandoc-1.19-1-amd64.deb /tmp/pandoc-1.19-1-amd64.deb
RUN dpkg -i /tmp/pandoc-1.19-1-amd64.deb

RUN { echo '#!/bin/bash'; \
      echo 'set -e'; \
      echo 'python3 /bootstrap.py'; \
      echo 'jupyter notebook'; \
    } > /entrypoint.sh \
 && chmod +x /entrypoint.sh

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

ENTRYPOINT ["/entrypoint.sh"]
