# spark

Cria a Imagem Docker parana/spark

This **Dockerfile** is a [trusted build](https://hub.docker.com/r/parana/spark/) of [Docker Registry](https://hub.docker.com/).

## Building on boot2docker & Docker Machine

You need to configure swap space in boot2docker / Docker Machine prior the build:

1. Log into boot2docker / Docker Machine: `boot2docker ssh` or `docker-machine ssh default` (replace `default` if needed).
2. Create a file named `bootlocal.sh` in `/var/lib/boot2docker/` with the following content:

        #!/bin/sh

        SWAPFILE=/mnt/sda1/swapfile

        dd if=/dev/zero of=$SWAPFILE bs=1024 count=2097152
        mkswap $SWAPFILE && chmod 600 $SWAPFILE && swapon $SWAPFILE

3. Make this file executable: `chmod u+x /var/lib/boot2docker/bootlocal.sh`

After restarting boot2docker / Docker Machine, it will have increased swap size.

## How to use


```
docker run -i -t -h my-spark -p 8080:8080 -p 9999:9999 --rm parana/spark bash
```

The Container Bash shell will open and you can type:

```
cd /usr/local/spark/sbin
./start-master.sh # starting org.apache.spark.deploy.master.Master, logging to /usr/local/spark/logs/
ps -ef | grep java 
ls -lAt /usr/local/spark/logs
cat /usr/local/spark/logs/* | grep "Starting Spark master at"
# Write the spark URL to remember (suppose: "spark://my-spark:7077")
cat /usr/local/spark/logs/* | grep port
# Use the URL of Master to start the Slave
./start-slave.sh spark://my-spark:7077
# Test the master’s web UI
sleep 5
curl http://localhost:8080
# To run Jupyter Notebook, use the following command:
jupyter notebook --no-browser --port 9999 &
sleep 10
curl http://localhost:9999
```

### Using Spark

Open on WEB Browser in host computer

```
http://localhost:8080
```

You will see something like this.

![Spark master admin View](https://raw.githubusercontent.com/joao-parana/spark/master/docs/images/spark-master-admin.png)

#### Interactive Analysis with the Spark Shell

Spark’s shell provides a simple way to learn the API, as well as a powerful tool 
to analyze data interactively. It is available in Scala which runs on the Java VM 
and is thus a good way to use existing Java libraries. Start it by running the 
following in the Spark directory:

```bash
spark-shell
```

Spark’s primary abstraction is a distributed collection of items called a 
Resilient Distributed Dataset (RDD). RDDs can be created from Hadoop 
InputFormats (such as HDFS files) or by transforming other RDDs. Let’s make 
a new RDD from the text of the README file in the Spark source directory:

```scala
val textFile = sc.textFile("README.md")
textFile: org.apache.spark.rdd.RDD[String] = README.md MapPartitionsRDD[1] at textFile at <console>:25
```

RDDs have actions, which return values, and transformations, which return 
pointers to new RDDs. Let’s start with a few actions:

```scala
textFile.count() // Number of items in this RDD
res0: Long = 126
```

```scala
textFile.first() // First item in this RDD
res1: String = # Apache Spark
```

Now let’s use a transformation. We will use the filter transformation to return 
a new RDD with a subset of the items in the file.

```scala
val linesWithSpark = textFile.filter(line => line.contains("Spark"))
linesWithSpark: org.apache.spark.rdd.RDD[String] = MapPartitionsRDD[2] at filter at <console>:27
```

We can chain together transformations and actions:

```scala
textFile.filter(line => line.contains("Spark")).count() // How many lines contain "Spark"?
res3: Long = 15
```

#### More on RDD Operations

RDD actions and transformations can be used for more complex computations. 

Let’s say we want to find the line with the most words:

```scala
textFile.map(line => line.split(" ").size).reduce((a, b) => if (a > b) a else b)
```

This first maps a line to an integer value, creating a new RDD. Method reduce is 
called on that RDD to find the largest line count. The arguments to map and 
reduce are Scala function literals (closures), and can use any language 
feature or Scala/Java library. For example, we can easily call functions 
declared elsewhere. We’ll use Math.max() function to make this code easier 
to understand:


```scala
import java.lang.Math
textFile.map(line => line.split(" ").size).reduce((a, b) => Math.max(a, b))
res5: Int = 15
```

One common data flow pattern is MapReduce, as popularized by Hadoop. Spark 
can implement MapReduce flows easily:

```scala
val wordCounts = textFile.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey((a, b) => a + b)
wordCounts: org.apache.spark.rdd.RDD[(String, Int)] = ShuffledRDD[8] at reduceByKey at <console>:28
```

Here, we combined the flatMap, map, and reduceByKey transformations to compute 
the per-word counts in the file as an RDD of (String, Int) pairs. To collect 
the word counts in our shell, we can use the collect action:

```scala
wordCounts.collect()
res6: Array[(String, Int)] = Array((means,1), (under,2), (this,3), (Because,1), (Python,2), (agree,1), (cluster.,1), ...)
```

#### Caching

Spark also supports pulling data sets into a cluster-wide in-memory cache. This 
is very useful when data is accessed repeatedly, such as when querying a 
small “hot” dataset or when running an iterative algorithm like PageRank. 

As a simple example, let’s mark our `linesWithSpark` dataset to be cached:

```scala
linesWithSpark.cache()
res7: linesWithSpark.type = MapPartitionsRDD[2] at filter at <console>:27
```

```scala
linesWithSpark.count()
res8: Long = 19

It may seem silly to use Spark to explore and cache a 100-line text file. The 
interesting part is that these same functions can be used on very large data 
sets, even when they are striped across tens or hundreds of nodes. You can 
also do this interactively by connecting `bin/spark-shell` to a cluster, as 
described in the 
[programming guide](http://spark.apache.org/docs/latest/programming-guide.html).

#### Self-Contained Java Applications

Suppose we wish to write a self-contained application using the Spark API. We 
will walk through a simple application in Java (with Maven).

This example will use Maven to compile an application JAR, but any similar 
build system will work.

We’ll create a very simple Spark application, `SimpleApp.java`:

```java
/* SimpleApp.java */
import org.apache.spark.api.java.*;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.function.Function;

public class SimpleApp {
  public static void main(String[] args) {
    // logFile Should be some file on your system
    String logFile = "/usr/local/spark/README.md"; 
    SparkConf conf = new SparkConf().setAppName("Simple Application");
    JavaSparkContext sc = new JavaSparkContext(conf);
    JavaRDD<String> logData = sc.textFile(logFile).cache();

    long numAs = logData.filter(new Function<String, Boolean>() {
      public Boolean call(String s) { return s.contains("a"); }
    }).count();

    long numBs = logData.filter(new Function<String, Boolean>() {
      public Boolean call(String s) { return s.contains("b"); }
    }).count();

    System.out.println("Lines with a: " + numAs + ", lines with b: " + numBs);
  }
}

```

This program just counts the number of lines containing ‘a’ and the number 
containing ‘b’ in a text file. Note that you’ll need to replace 
/usr/local/spark with the location where Spark is installed (if you will
run this code in another environment). 

As with the Scala example, we initialize a SparkContext, though we use the 
special JavaSparkContext class to get a Java-friendly one. 

We also create **RDDs** (represented by JavaRDD) and run transformations on 
them. Finally, we pass functions to Spark by creating classes that extend 
spark.api.java.function.Function. The Spark programming guide describes these 
differences in more detail.

To build the program, we also write a Maven pom.xml file that lists Spark as a 
dependency. 

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>br.com.joao-parana</groupId>
  <artifactId>myspark</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>jar</packaging>
  <name>myspark</name>
  <url>http://maven.apache.org</url>
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>
  <dependencies>
    <dependency> <!-- Spark dependency -->
      <groupId>org.apache.spark</groupId>
      <artifactId>spark-core_2.11</artifactId>
      <version>2.0.0</version>
    </dependency>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.8.1</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
</project>
```

This project is already created at /desenv/java/myspark, so now you can run 
this Java Program using :

```bash
cd /desenv/java/myspark
/usr/local/spark/bin/spark-submit \
    --class "spark.SimpleApp" \
    --master local[4] \
    target/myspark-1.0-SNAPSHOT.jar 2> /dev/null 
```

See `Dockerfile` for details about where this files are located in host 
computer. For example:

```bash
COPY test /desenv/java/
```


#### Where to Go from Here

Congratulations on running your first Spark application!

For an in-depth overview of the API, start with the 
[Spark programming guide](http://spark.apache.org/docs/latest/programming-guide.html), 
or see “Programming Guides” menu for other components like : **MLlib** 
for _Machine Learning_ API.

For running applications on a cluster, head to the deployment overview.

Finally, Spark includes several samples in the examples directory (Scala, 
Java, Python, R). You can run them as follows:


```bash
# For Scala and Java, use run-example:
/usr/local/spark/bin/run-example SparkPi
```

This shell `run-example` delegate the execution to 
`/usr/local/spark/bin/spark-class` which invoke the class
`org.apache.spark.deploy.SparkSubmit` passing all parameters.

In the other hand this shell `spark-class` ensure the environment is set 
running load-spark-env.sh, find Spark jars, set the LAUNCH_CLASSPATH variable
and build the command to be executed. Then start JVM to run the command.

In this case of running `SparkPi` the command build is something like this:

```bash
/opt/jdk1.8.0_91/bin/java \
    -cp /usr/local/spark/conf/:/usr/local/spark/jars/* \
    -Xmx1g \
    org.apache.spark.deploy.SparkSubmit \
    --jars /usr/local/spark/examples/jars/scopt_2.11-3.3.0.jar,/usr/local/spark/examples/jars/spark-examples_2.11-2.0.0.jar \
    --class org.apache.spark.examples.SparkPi spark-internal

```

So, you can use `/desenv/java/run-example.sh SparkPi` to run SparkPi example.
 

#### Launching Spark jobs from Java or Scala

The org.apache.spark.launcher package provides classes for launching Spark 
jobs as child processes using a simple Java API.

#### Unit Testing

Spark is friendly to unit testing with any popular unit test framework. 
Simply create a SparkContext in your test with the master URL set to local, 
run your operations, and then call SparkContext.stop() to tear it down. 
Make sure you stop the context within a finally block or the test 
framework’s tearDown method, as Spark does not support two contexts 
running concurrently in the same program.

### Using Jupyter Notebook

This Container have a Python 3.5.2 instalation provided by 
Continuum Analytics, Inc.

You can start a Jupyter Notebook server and interact with Anaconda via your 
browser:

```
docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"
```

You can then view the Jupyter Notebook by opening http://localhost:8888 in 
your browser, or `http://<DOCKER-MACHINE-IP>:8888` if you are using a Docker 
Machine VM on macOS or Windows Operating Systems. `<DOCKER-MACHINE-IP>` is 
`localhost` if you are using the recently released version of Docker for macOS

Jupyter Notebook is a very useful tool if you need to create a live document with 
running code inside, much like Swift Playground avaiable on macOS / XCode.

