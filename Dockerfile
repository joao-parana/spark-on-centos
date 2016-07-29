FROM parana/centos7

# Based on centos:7.2.1511 Public Image

MAINTAINER "João Antonio Ferreira" <joao.parana@gmail.com>`

ENV REFRESHED_AT 2016-07-28-14-00-00

#
# Please execute cd install && curl -O http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz to Download binary files if you prefer
#

# Set environment
ENV JAVA_HOME /opt/jdk1.8.0_91

# ENV CATALINA_HOME /usr/local/tomcat
ENV PATH ${JAVA_HOME}/bin:${PATH}:.

# ENV TOMCAT_MAJOR_VERSION 8
# ENV TOMCAT_VERSION 8.0.36
# ENV TOMCAT_SITE    http://archive.apache.org/dist/tomcat
# ENV TOMCAT_TGZ_URL ${TOMCAT_SITE}/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
# ENV TOMCAT_FILE    apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Java Version  1.8.0_91-b14
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 91
ENV JAVA_VERSION_BUILD 14
ENV JAVA_PACKAGE       jdk
ENV ORACLE_SITE        download.oracle.com/otn-pub/java/jdk
ENV JAVA_FILE          ${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz

ENV JAVA_OPTS="-Xms512m -Xmx1024m"

# ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
# ENV ORACLE_SID  XE
# ENV PATH        $ORACLE_HOME/bin:$PATH

COPY install /tmp/
# RUN find /tmp -type d | sort 

# File was splited using: split -b 49000000 ../spark-2.0.0-bin-hadoop2.7.tgz

WORKDIR /tmp

RUN echo "Generating spark-2.0.0-bin-hadoop2.7.tar.gz file" && \
    cd spark-2.0.0-bin-hadoop2.7 && \
    cat xaa xab xac xad > spark-2.0.0-bin-hadoop2.7.tar.gz && \
    rm -rf xaa xab xac xad && \
    tar -xzf spark-2.0.0-bin-hadoop2.7.tar.gz && \
    rm -rf spark-2.0.0-bin-hadoop2.7.tar.gz && \
    mv spark-2.0.0-bin-hadoop2.7 /usr/local/spark && \
    cd .. && rm -rf spark-2.0.0-bin-hadoop2.7 && \
    chown root:root -R /usr/local/spark

RUN echo "Generating ${JAVA_FILE}" && \
    cd jdk8 && cat xaa xab xac xad > ${JAVA_FILE} && \
    rm -rf xaa xab xac xad 

# unarchive Java
RUN cd jdk8 && \
    cat ${JAVA_FILE} | tar -xzf - -C /opt && \
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

ENV ANACONDA_SHA  4f5c95feb0e7efeadd3d348dcef117d7787c799f24b0429e45017008f3534e55
ENV ANACONDA_FILE Anaconda3-4.1.1-Linux-x86_64.sh

RUN cd anaconda-3-4-1 && \
    cat xaa xab xac xad xae xaf xag xah xai > ${ANACONDA_FILE}
    echo "••• `date` - Verify the Checksum for ${ANACONDA_FILE} " && \
    echo `sha256sum ${ANACONDA_FILE}` && \
    echo ${ANACONDA_SHA}` && \
    rm -rf xaa xab xac xad xae xaf xag xah xai && \
    echo "••• `date` - Please, Install ${ANACONDA_FILE} !"

CMD ["/bin/bash"]
