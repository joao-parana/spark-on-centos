package spark;

/* spark.Tutorial.java */
import java.util.*;
import org.apache.spark.api.java.*;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.function.*;
import org.apache.spark.storage.*;

public class Tutorial {
  public static void main(String[] args) {
    // Overview
    // At a high level, every Spark application consists of a driver program that runs the user’s main function and executes various parallel operations on a cluster. The main abstraction Spark provides is a resilient distributed dataset (RDD), which is a collection of elements partitioned across the nodes of the cluster that can be operated on in parallel. RDDs are created by starting with a file in the Hadoop file system (or any other Hadoop-supported file system), or an existing Scala collection in the driver program, and transforming it. Users may also ask Spark to persist an RDD in memory, allowing it to be reused efficiently across parallel operations. Finally, RDDs automatically recover from node failures.
    //
    //  A second abstraction in Spark is shared variables that can be used in parallel operations. By default, when Spark runs a function in parallel as a set of tasks on different nodes, it ships a copy of each variable used in the function to each task. Sometimes, a variable needs to be shared across tasks, or between tasks and the driver program. Spark supports two types of shared variables: broadcast variables, which can be used to cache a value in memory on all nodes, and accumulators, which are variables that are only “added” to, such as counters and sums.
    //
    // This guide shows each of these features in each of Spark’s supported languages. It is easiest to follow along with if you launch Spark’s interactive shell – either bin/spark-shell for the Scala shell or bin/pyspark for the Python one.
    //
    // The first thing a Spark program must do is to create a JavaSparkContext object, which tells Spark how to access a cluster. 
    // To create a SparkContext you first need to build a SparkConf object that contains information about your application.
    
    String appName = "Tutorial_1"; 
    String master = "spark://my-spark:7077";

    SparkConf conf = new SparkConf().setAppName(appName).setMaster(master);
    JavaSparkContext sc = new JavaSparkContext(conf);

    // The appName parameter is a name for your application to show on the cluster UI. master is a Spark, Mesos or YARN cluster URL, or a special “local” string to run in local mode. In practice, when running on a cluster, you will not want to hardcode master in the program, but rather launch the application with spark-submit and receive it there. However, for local testing and unit tests, you can pass “local” to run Spark in-process.

    // Resilient Distributed Datasets (RDDs)
    // Spark revolves around the concept of a resilient distributed dataset (RDD), which is a fault-tolerant collection of elements that can be operated on in parallel. There are two ways to create RDDs: parallelizing an existing collection in your driver program, or referencing a dataset in an external storage system, such as a shared filesystem, HDFS, HBase, or any data source offering a Hadoop InputFormat.

    // Parallelized collections are created by calling JavaSparkContext’s parallelize method on an existing Collection in your driver program. The elements of the collection are copied to form a distributed dataset that can be operated on in parallel. For example, here is how to create a parallelized collection holding the numbers 1 to 5:

    List<Integer> data = Arrays.asList(1, 2, 3, 4, 5);
    JavaRDD<Integer> distData = sc.parallelize(data);

    // Once created, the distributed dataset (distData) can be operated on in parallel. For example, we might call distData.reduce((a, b) -> a + b) to add up the elements of the list. We describe operations on distributed datasets later on.
    // Note: In this guide, we’ll often use the concise Java 8 lambda syntax to specify Java functions, but in older versions of Java you can implement the interfaces in the org.apache.spark.api.java.function package. We describe passing functions to Spark in more detail below.
    // One important parameter for parallel collections is the number of partitions to cut the dataset into. Spark will run one task for each partition of the cluster. Typically you want 2-4 partitions for each CPU in your cluster. Normally, Spark tries to set the number of partitions automatically based on your cluster. However, you can also set it manually by passing it as a second parameter to parallelize (e.g. sc.parallelize(data, 10)). Note: some places in the code use the term slices (a synonym for partitions) to maintain backward compatibility.

    // Spark can create distributed datasets from any storage source supported by Hadoop, including your local file system
    JavaRDD<String> distFile = sc.textFile("data.txt");
    // Once created, distFile can be acted on by dataset operations. For example, we can add up the sizes of all the lines using the map and reduce operations as follows: 
    int totalLength = distFile.map(s -> s.length()).reduce((a, b) -> a + b);

    // Some notes on reading files with Spark:

    // If using a path on the local filesystem, the file must also be accessible at the same path on worker nodes. Either copy the file to all workers or use a network-mounted shared file system.

    // All of Spark’s file-based input methods, including textFile, support running on directories, compressed files, and wildcards as well. For example, you can use textFile("/my/directory"), textFile("/my/directory/*.txt"), and textFile("/my/directory/*.gz").

    // The textFile method also takes an optional second argument for controlling the number of partitions of the file. By default, Spark creates one partition for each block of the file (blocks being 64MB by default in HDFS), but you can also ask for a higher number of partitions by passing a larger value. Note that you cannot have fewer partitions than blocks.

    // Apart from text files, Spark’s Java API also supports several other data formats: For example, JavaSparkContext.wholeTextFiles lets you read a directory containing multiple small text files, and returns each of them as (filename, content) pairs. This is in contrast with textFile, which would return one record per line in each file.

    // RDD Operations
    // RDDs support two types of operations: transformations, which create a new dataset from an existing one, and actions, which return a value to the driver program after running a computation on the dataset. For example, map is a transformation that passes each dataset element through a function and returns a new RDD representing the results. On the other hand, reduce is an action that aggregates all the elements of the RDD using some function and returns the final result to the driver program (although there is also a parallel reduceByKey that returns a distributed dataset).

    // All transformations in Spark are lazy, in that they do not compute their results right away. Instead, they just remember the transformations applied to some base dataset (e.g. a file). The transformations are only computed when an action requires a result to be returned to the driver program. This design enables Spark to run more efficiently. For example, we can realize that a dataset created through map will be used in a reduce and return only the result of the reduce to the driver, rather than the larger mapped dataset.

    // By default, each transformed RDD may be recomputed each time you run an action on it. However, you may also persist an RDD in memory using the persist (or cache) method, in which case Spark will keep the elements around on the cluster for much faster access the next time you query it. There is also support for persisting RDDs on disk, or replicated across multiple nodes.

    // To illustrate RDD basics, consider the simple program below:

    JavaRDD<String> lines = sc.textFile("data.txt");
    JavaRDD<Integer> lineLengths = lines.map(s -> s.length());
    totalLength = lineLengths.reduce((a, b) -> a + b);

    // The first line defines a base RDD from an external file. This dataset is not loaded in memory or otherwise acted on: lines is merely a pointer to the file. The second line defines lineLengths as the result of a map transformation. Again, lineLengths is not immediately computed, due to laziness. Finally, we run reduce, which is an action. At this point Spark breaks the computation into tasks to run on separate machines, and each machine runs both its part of the map and a local reduction, returning only its answer to the driver program.

    // If we also wanted to use lineLengths again later, we could add: lineLengths.persist(StorageLevel.MEMORY_ONLY()); before the reduce, which would cause lineLengths to be saved in memory after the first time it is computed.
    
    lines = sc.textFile("data.txt");
    lineLengths = lines.map(s -> s.length());
    lineLengths.persist(StorageLevel.MEMORY_ONLY());
    totalLength = lineLengths.reduce((a, b) -> a + b);

    // Spark’s API relies heavily on passing functions in the driver program to run on the cluster. In Java, functions are represented by classes implementing the interfaces in the org.apache.spark.api.java.function package. There are two ways to create such functions:

    // Implement the Function interfaces in your own class, either as an anonymous inner class or a named one, and pass an instance of it to Spark.
    // In Java 8, use lambda expressions to concisely define an implementation.
    // While much of this guide uses lambda syntax for conciseness, it is easy to use all the same APIs in long-form. For example, we could have written our code above as follows:

    lines = sc.textFile("data.txt");
    lineLengths = lines.map(new Function<String, Integer>() {
      public Integer call(String s) { return s.length(); }
    });
    totalLength = lineLengths.reduce(new Function2<Integer, Integer, Integer>() {
      public Integer call(Integer a, Integer b) { return a + b; }
    });

    // Or, if writing the functions inline is unwieldy:
    lines = sc.textFile("data.txt");
    lineLengths = lines.map(new GetLength());
    totalLength = lineLengths.reduce(new Sum());
    
    // Note that anonymous inner classes in Java can also access variables in the enclosing scope as long as they are marked final. Spark will ship copies of these variables to each worker node as it does for other languages.


  }
}

class GetLength implements Function<String, Integer> {
  public Integer call(String s) { return s.length(); }
}

class Sum implements Function2<Integer, Integer, Integer> {
  public Integer call(Integer a, Integer b) { return a + b; }
}