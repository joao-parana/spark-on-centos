FROM parana/centos7

# Based on centos:7.2.1511 Public Image

MAINTAINER "João Antonio Ferreira" <joao.parana@gmail.com>`

ENV REFRESHED_AT 2016-12-02

#
# If you prefer download file for yourself, please execute: cd install && curl -O http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz to Download binary files 
#

# Set environment
ENV JAVA_HOME /opt/jdk1.8.0_91
ENV PATH ${JAVA_HOME}/bin:${PATH}:.

# Java Version  1.8.0_91-b14
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 91
ENV JAVA_VERSION_BUILD 14
ENV JAVA_PACKAGE       jdk
ENV ORACLE_SITE        download.oracle.com/otn-pub/java/jdk
ENV JAVA_FILE          ${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz

ENV JAVA_OPTS="-Xms512m -Xmx1024m"

COPY install /tmp/

WORKDIR /tmp

RUN find . -type d | sort 

RUN echo "Generating spark-2.0.0-bin-hadoop2.7.tar.gz file" && \
    tar -xf spark-2.0.2-bin-hadoop2.7.tar && \
    rm -rf spark-2.0.2-bin-hadoop2.7.tar && \
    mv spark-2.0.2-bin-hadoop2.7 /usr/local/spark && \
    chown root:root -R /usr/local/spark

# unarchive Java
RUN cat ${JAVA_FILE} | tar -xzf - -C /opt && \
    chown root:root -R /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} && \
    ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk && \
    rm -rf /opt/jdk/*src.zip \
           /opt/jdk/lib/missioncontrol \
           /opt/jdk/lib/visualvm \
           /opt/jdk/lib/*javafx* \
           /opt/jdk/jre/lib/plugin.jar \
           /opt/jdk/jre/lib/ext/jfxrt.jar \
           /opt/jdk/jre/bin/javaws \
           /opt/jdk/jre/lib/javaws.jar \
           /opt/jdk/jre/lib/desktop \
           /opt/jdk/jre/plugin \
           /opt/jdk/jre/lib/deploy* \
           /opt/jdk/jre/lib/*javafx* \
           /opt/jdk/jre/lib/*jfx* \
           /opt/jdk/jre/lib/amd64/libdecora_sse.so \
           /opt/jdk/jre/lib/amd64/libprism_*.so \
           /opt/jdk/jre/lib/amd64/libfxplugins.so \
           /opt/jdk/jre/lib/amd64/libglass.so \
           /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jdk/jre/lib/amd64/libjavafx*.so \
           /opt/jdk/jre/lib/amd64/libjfx*.so

# RUN TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
#     echo "TINI_VERSION = ${TINI_VERSION}"

ENV TINI_VERSION 0.16.1
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}-amd64.rpm /tmp/tini_${TINI_VERSION}-amd64.rpm
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}-amd64.rpm.asc /tmp/tini_${TINI_VERSION}-amd64.rpm.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --verify /tmp/tini_${TINI_VERSION}-amd64.rpm.asc

RUN yum install -y /tmp/tini_${TINI_VERSION}-amd64.rpm && \
    rm -rf /tmp/tini_${TINI_VERSION}-amd64.rpm && \
    yum clean all

RUN tar xzf apache-maven-3.5.2-bin.tar.gz && \
    chown root:root -R apache-maven-3.5.2 && \
    mv apache-maven-3.5.2 /usr/local/maven3 && \
    rm -rf apache-maven-3.5.2-bin.tar.gz

ENV PATH /usr/local/maven3/bin:/usr/local/spark/bin:/usr/local/miniconda/bin:${PATH}

RUN bash /tmp/Miniconda2-latest-Linux-x86_64.sh -b -p /usr/local/miniconda && \
    conda install -y scikit-learn && \
    conda install -y cython

RUN conda install -y jupyter

RUN curl -L -o coursier https://git.io/vgvpD && chmod +x coursier && mv coursier /usr/local/bin && coursier --help

RUN ls -la /tmp/* && /tmp/jupyter-scala && mv /tmp/jupyter-scala /usr/local/bin/

RUN mkdir -p /desenv/java && mvn -v

COPY test /desenv/java/

WORKDIR /desenv/java

VOLUME /usr/local/m2-repo

# VOLUME /root/.m2/repository
COPY m2-repo /root/.m2/repository

# test requires large memory configured on JVM
# RUN cd myspark && mvn clean compile test package install
RUN cd myspark && mvn clean compile package install -Dmaven.test.skip=true

# Spark
EXPOSE 8080
EXPOSE 7077
EXPOSE 6066
# Jupyter Notebook
EXPOSE 8888

ENTRYPOINT [ "/usr/bin/tini", "--" ]

RUN echo "Execute: jupyter notebook --no-browser --ip spark.local"
# open http://spark.local:8888/

CMD [ "/bin/bash" ]

