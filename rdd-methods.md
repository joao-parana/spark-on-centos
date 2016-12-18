# RDD Methods

Version 2.02 list of Methods

## Static Methods


------

```java
static DoubleRDDFunctions doubleRDDToDoubleRDDFunctions(RDD<Object> rdd)
```

------

```java
static <T> DoubleRDDFunctions numericRDDToDoubleRDDFunctions(RDD<T> rdd, scala.math.Numeric<T> num)
```

------
```java
static <T> AsyncRDDActions<T> rddToAsyncRDDActions(RDD<T> rdd, scala.reflect.ClassTag<T> evidence$33) 
```

------

```java
static <K,V> OrderedRDDFunctions<K,V,scala.Tuple2<K,V>> rddToOrderedRDDFunctions(RDD<scala.Tuple2<K,V>> rdd, scala.math.Ordering<K> evidence$34, scala.reflect.ClassTag<K> evidence$35, scala.reflect.ClassTag<V> evidence$36)
```

------

```java
static <K,V> PairRDDFunctions<K,V>  rddToPairRDDFunctions(RDD<scala.Tuple2<K,V>> rdd, scala.reflect.ClassTag<K> kt, scala.reflect.ClassTag<V> vt, scala.math.Ordering<K> ord)
```

------

```java
static <K,V> SequenceFileRDDFunctions<K,V>  rddToSequenceFileRDDFunctions(RDD<scala.Tuple2<K,V>> rdd, scala.reflect.ClassTag<K> kt, scala.reflect.ClassTag<V> vt,  keyWritableFactory,  valueWritableFactory)
```


## Transformations, Actions and utilities

All methods that return RDD are Transformations.

------

```java
RDD<T> cache()
```

Persist this RDD with the default storage level (`MEMORY_ONLY`).

------

```java
<U> RDD<scala.Tuple2<T,U>> cartesian(RDD<U> other, scala.reflect.ClassTag<U> evidence$5)
```

Return the Cartesian product of this RDD and another one, that is, the RDD of all pairs of elements (a, b) where a is in this and b is in other.

------

```java
void  checkpoint()
```

Mark this RDD for checkpointing.

------

```java
RDD<T>  coalesce(int numPartitions, boolean shuffle, scala.Option<PartitionCoalescer> partitionCoalescer, scala.math.Ordering<T> ord)
```

Return a new RDD that is reduced into numPartitions partitions.

------

```java
Object  collect()
```

Return an array that contains all of the elements in this RDD.

------

```java
<U> RDD<U>  collect(scala.PartialFunction<T,U> f, scala.reflect.ClassTag<U> evidence$28)
```

Return an RDD that contains all matching values by applying f.

------

```java
abstract scala.collection.Iterator<T> Developer APIcompute(Partition split, TaskContext context)
```

Implemented by subclasses to compute a given partition.

------

```java
SparkContext  context()
```

The SparkContext that this RDD was created on.

------

```java
long  count()
```

Return the number of elements in the RDD.

------

```java
PartialResult<BoundedDouble>  countApprox(long timeout, double confidence)
```

Approximate version of count() that returns a potentially incomplete result within a timeout, even if not all tasks have finished.

------

```java
long  countApproxDistinct(double relativeSD)
```

Return approximate number of distinct elements in the RDD.

------

```java
long  countApproxDistinct(int p, int sp)
```

Return approximate number of distinct elements in the RDD.

------

```java
scala.collection.Map<T,Object>  countByValue(scala.math.Ordering<T> ord)
```

Return the count of each unique value in this RDD as a local map of (value, count) pairs.

------

```java
PartialResult<scala.collection.Map<T,BoundedDouble>>  countByValueApprox(long timeout, double confidence, scala.math.Ordering<T> ord)
```

Approximate version of countByValue().

------

```java
scala.collection.Seq<Dependency<?>> dependencies()
```

Get the list of dependencies of this RDD, taking into account whether the RDD is checkpointed or not.

------

```java
RDD<T>  distinct()
```

Return a new RDD containing the distinct elements in this RDD.

------

```java
RDD<T>  distinct(int numPartitions, scala.math.Ordering<T> ord)
```

Return a new RDD containing the distinct elements in this RDD.

------

```java
RDD<T>  filter(scala.Function1<T,Object> f)
```

Return a new RDD containing only the elements that satisfy a predicate.

------

```java
T first()
```

Return the first element in this RDD.

------

```java
<U> RDD<U>  flatMap(scala.Function1<T,scala.collection.TraversableOnce<U>> f, scala.reflect.ClassTag<U> evidence$4)
```

Return a new RDD by first applying a function to all elements of this RDD, and then flattening the results.

------

```java
T fold(T zeroValue, scala.Function2<T,T,T> op)
```

Aggregate the elements of each partition, and then the results for all the partitions, using a given associative function and a neutral "zero value".

------

```java
void  foreach(scala.Function1<T,scala.runtime.BoxedUnit> f)
```

Applies a function f to all elements of this RDD.

------

```java
void  foreachPartition(scala.Function1<scala.collection.Iterator<T>,scala.runtime.BoxedUnit> f)
```

Applies a function f to each partition of this RDD.

------

```java
scala.Option<String>  getCheckpointFile()
```

Gets the name of the directory to which this RDD was checkpointed.

------

```java
int getNumPartitions()
```

Returns the number of partitions of this RDD.

------

```java
StorageLevel  getStorageLevel()
```

Get the RDD's current storage level, or StorageLevel.NONE if none is set.

------

```java
RDD<Object> glom()
```

Return an RDD created by coalescing all elements within each partition into an array.

------

```java
<K> RDD<scala.Tuple2<K,scala.collection.Iterable<T>>> groupBy(scala.Function1<T,K> f, scala.reflect.ClassTag<K> kt)
```

Return an RDD of grouped items.

------

```java
<K> RDD<scala.Tuple2<K,scala.collection.Iterable<T>>> groupBy(scala.Function1<T,K> f, int numPartitions, scala.reflect.ClassTag<K> kt)
```

Return an RDD of grouped elements.

------

```java
<K> RDD<scala.Tuple2<K,scala.collection.Iterable<T>>> groupBy(scala.Function1<T,K> f, Partitioner p, scala.reflect.ClassTag<K> kt, scala.math.Ordering<K> ord)
```

Return an RDD of grouped items.

------

```java
int id()
```

A unique ID for this RDD (within its SparkContext).

------

```java
RDD<T>  intersection(RDD<T> other)
```

Return the intersection of this RDD and another one.

------

```java
RDD<T>  intersection(RDD<T> other, int numPartitions)
```

Return the intersection of this RDD and another one.

------

```java
RDD<T>  intersection(RDD<T> other, Partitioner partitioner, scala.math.Ordering<T> ord)
```

Return the intersection of this RDD and another one.

------

```java
boolean isCheckpointed()
```

Return whether this RDD is checkpointed and materialized, either reliably or locally.

------

```java
boolean isEmpty()
```

No descripton at all.

------

```java
scala.collection.Iterator<T>  iterator(Partition split, TaskContext context)
```

Internal method to this RDD; will read from cache if applicable, or otherwise compute it.

------

```java
<K> RDD<scala.Tuple2<K,T>>  keyBy(scala.Function1<T,K> f)
```

Creates tuples of the elements in this RDD by applying f.

------

```java
RDD<T>  localCheckpoint()
```

Mark this RDD for local checkpointing using Spark's existing caching layer.

------

```java
<U> RDD<U>  map(scala.Function1<T,U> f, scala.reflect.ClassTag<U> evidence$3)
```

Return a new RDD by applying a function to all elements of this RDD.

------

```java
<U> RDD<U>  mapPartitions(scala.Function1<scala.collection.Iterator<T>,scala.collection.Iterator<U>> f, boolean preservesPartitioning, scala.reflect.ClassTag<U> evidence$6)
```

Return a new RDD by applying a function to each partition of this RDD.

------

```java
<U> RDD<U>  mapPartitionsWithIndex(scala.Function2<Object,scala.collection.Iterator<T>,scala.collection.Iterator<U>> f, boolean preservesPartitioning, scala.reflect.ClassTag<U> evidence$8)
```

Return a new RDD by applying a function to each partition of this RDD, while tracking the index of the original partition.

------

```java
T max(scala.math.Ordering<T> ord)
```

Returns the max of this RDD as defined by the implicit Ordering[T].

------

```java
T min(scala.math.Ordering<T> ord)
```

Returns the min of this RDD as defined by the implicit Ordering[T].

------

```java
String  name()
```

A friendly name for this RDD

------

```java
scala.Option<Partitioner> partitioner()
```

Optionally overridden by subclasses to specify how they are partitioned.

------

```java
Partition[] partitions()
```

Get the array of partitions of this RDD, taking into account whether the RDD is checkpointed or not.

------

```java
RDD<T>  persist()
```

Persist this RDD with the default storage level (`MEMORY_ONLY`).

------

```java
RDD<T>  persist(StorageLevel newLevel)
```

Set this RDD's storage level to persist its values across operations after the first time it is computed.

------

```java
RDD<String> pipe(scala.collection.Seq<String> command, scala.collection.Map<String,String> env, scala.Function1<scala.Function1<String,scala.runtime.BoxedUnit>,scala.runtime.BoxedUnit> printPipeContext, scala.Function2<T,scala.Function1<String,scala.runtime.BoxedUnit>,scala.runtime.BoxedUnit> printRDDElement, boolean separateWorkingDir, int bufferSize, String encoding)
```

Return an RDD created by piping elements to a forked external process.

------

```java
RDD<String> pipe(String command)
```

Return an RDD created by piping elements to a forked external process.

------

```java
RDD<String> pipe(String command, scala.collection.Map<String,String> env)
```

Return an RDD created by piping elements to a forked external process.

------

```java
scala.collection.Seq<String>  preferredLocations(Partition split)
```

Get the preferred locations of a partition, taking into account whether the RDD is checkpointed.

------

```java
RDD<T>[]  randomSplit(double[] weights, long seed)
```

Randomly splits this RDD with the provided weights.

------

```java
T reduce(scala.Function2<T,T,T> f)
```

Reduces the elements of this RDD using the specified commutative and associative binary operator.

------

```java
RDD<T>  repartition(int numPartitions, scala.math.Ordering<T> ord)
```

Return a new RDD that has exactly numPartitions partitions.

------

```java
RDD<T>  sample(boolean withReplacement, double fraction, long seed)
```

Return a sampled subset of this RDD.

------

```java
void  saveAsObjectFile(String path)
```

Save this RDD as a SequenceFile of serialized objects.

------

```java
void  saveAsTextFile(String path)
```

Save this RDD as a text file, using string representations of elements.

------

```java
void  saveAsTextFile(String path, Class<? extends org.apache.hadoop.io.compress.CompressionCodec> codec)
```

Save this RDD as a compressed text file, using string representations of elements.

------

```java
RDD<T>  setName(String _name)
```

Assign a name to this RDD

------

```java
<K> RDD<T>  sortBy(scala.Function1<T,K> f, boolean ascending, int numPartitions, scala.math.Ordering<K> ord, scala.reflect.ClassTag<K> ctag)
```

Return this RDD sorted by the given key function.

------

```java
SparkContext  sparkContext()
```

The SparkContext that created this RDD.

------

```java
RDD<T>  subtract(RDD<T> other)
```

Return an RDD with the elements from this that are not in other.

------

```java
RDD<T>  subtract(RDD<T> other, int numPartitions)
```

Return an RDD with the elements from this that are not in other.

------

```java
RDD<T>  subtract(RDD<T> other, Partitioner p, scala.math.Ordering<T> ord)
```

Return an RDD with the elements from this that are not in other.

------

```java
Object  take(int num)
```

Take the first num elements of the RDD.

------

```java
Object  takeOrdered(int num, scala.math.Ordering<T> ord)
```

Returns the first k (smallest) elements from this RDD as defined by the specified implicit Ordering[T] and maintains the ordering.

------

```java
Object  takeSample(boolean withReplacement, int num, long seed)
```

Return a fixed-size sampled subset of this RDD in an array

------

```java
String  toDebugString()
```

A description of this RDD and its recursive dependencies for debugging.

------

```java
JavaRDD<T>  toJavaRDD()
```

No description at all.

------

```java
scala.collection.Iterator<T>  toLocalIterator()
```

Return an iterator that contains all of the elements in this RDD.

------

```java
Object  top(int num, scala.math.Ordering<T> ord)
```

Returns the top k (largest) elements from this RDD as defined by the specified implicit Ordering[T] and maintains the ordering.

------

```java
String  toString()
```

No description at all.

------

```java
<U> U treeAggregate(U zeroValue, scala.Function2<U,T,U> seqOp, scala.Function2<U,U,U> combOp, int depth, scala.reflect.ClassTag<U> evidence$30)
```

Aggregates the elements of this RDD in a multi-level tree pattern.

------

```java
T treeReduce(scala.Function2<T,T,T> f, int depth)
```

Reduces the elements of this RDD in a multi-level tree pattern.

------

```java
RDD<T>  union(RDD<T> other)
```

Return the union of this RDD and another one.

------

```java
RDD<T>  unpersist(boolean blocking)
```

Mark the RDD as non-persistent, and remove all blocks for it from memory and disk.

------

```java
<U> RDD<scala.Tuple2<T,U>>  zip(RDD<U> other, scala.reflect.ClassTag<U> evidence$9)
```

Zips this RDD with another one, returning key-value pairs with the first element in each RDD, second element in each RDD, etc.

------

```java
<B,V> RDD<V>  zipPartitions(RDD<B> rdd2, boolean preservesPartitioning, scala.Function2<scala.collection.Iterator<T>,scala.collection.Iterator<B>,scala.collection.Iterator<V>> f, scala.reflect.ClassTag<B> evidence$10, scala.reflect.ClassTag<V> evidence$11)
```

Zip this RDD's partitions with one (or more) RDD(s) and return a new RDD by applying a function to the zipped partitions.

------

```java
<B,V> RDD<V>  zipPartitions(RDD<B> rdd2, scala.Function2<scala.collection.Iterator<T>,scala.collection.Iterator<B>,scala.collection.Iterator<V>> f, scala.reflect.ClassTag<B> evidence$12, scala.reflect.ClassTag<V> evidence$13)
```

No description at all.

------

```java
<B,C,V> RDD<V>  zipPartitions(RDD<B> rdd2, RDD<C> rdd3, boolean preservesPartitioning, scala.Function3<scala.collection.Iterator<T>,scala.collection.Iterator<B>,scala.collection.Iterator<C>,scala.collection.Iterator<V>> f, scala.reflect.ClassTag<B> evidence$14, scala.reflect.ClassTag<C> evidence$15, scala.reflect.ClassTag<V> evidence$16)
```

No description at all.

------

```java
<B,C,V> RDD<V>  zipPartitions(RDD<B> rdd2, RDD<C> rdd3, scala.Function3<scala.collection.Iterator<T>,scala.collection.Iterator<B>,scala.collection.Iterator<C>,scala.collection.Iterator<V>> f, scala.reflect.ClassTag<B> evidence$17, scala.reflect.ClassTag<C> evidence$18, scala.reflect.ClassTag<V> evidence$19)
```

No description at all.

------

```java
<B,C,D,V> RDD<V>  zipPartitions(RDD<B> rdd2, RDD<C> rdd3, RDD<D> rdd4, boolean preservesPartitioning, scala.Function4<scala.collection.Iterator<T>,scala.collection.Iterator<B>,scala.collection.Iterator<C>,scala.collection.Iterator<D>,scala.collection.Iterator<V>> f, scala.reflect.ClassTag<B> evidence$20, scala.reflect.ClassTag<C> evidence$21, scala.reflect.ClassTag<D> evidence$22, scala.reflect.ClassTag<V> evidence$23)
```

No description at all.

------

```java
<B,C,D,V> RDD<V>  zipPartitions(RDD<B> rdd2, RDD<C> rdd3, RDD<D> rdd4, scala.Function4<scala.collection.Iterator<T>,scala.collection.Iterator<B>,scala.collection.Iterator<C>,scala.collection.Iterator<D>,scala.collection.Iterator<V>> f, scala.reflect.ClassTag<B> evidence$24, scala.reflect.ClassTag<C> evidence$25, scala.reflect.ClassTag<D> evidence$26, scala.reflect.ClassTag<V> evidence$27)
```

No description at all.

------

```java
RDD<scala.Tuple2<T,Object>> zipWithIndex()
```

Zips this RDD with its element indices.

------

```java
RDD<scala.Tuple2<T,Object>> zipWithUniqueId()
```

Zips this RDD with generated unique Long ids.
