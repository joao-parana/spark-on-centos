#!/bin/bash

set -e

/opt/jdk1.8.0_91/bin/java \
    -cp /usr/local/spark/conf/:/usr/local/spark/jars/* \
    -Xmx1g \
    org.apache.spark.deploy.SparkSubmit \
    --jars /usr/local/spark/examples/jars/scopt_2.11-3.3.0.jar,/usr/local/spark/examples/jars/spark-examples_2.11-2.0.0.jar \
    --class org.apache.spark.examples.$1 spark-internal