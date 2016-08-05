package spark;

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.junit.Before;
import org.junit.Test;

public class SimpleTest {
	private JavaSparkContext sparkCtx;

	@Before
	public void init() throws IllegalArgumentException, IOException {
		// ctxtBuilder = new ContextBuilder(tempFolder);
		SparkConf conf = new SparkConf();
		conf.setMaster("local[2]");
		conf.setAppName("junit");
		this.sparkCtx = new JavaSparkContext(conf);
	}

	@Test
	public void testSimpleRdd() {
		final List<Integer> nums = new ArrayList<Integer>();
		nums.add(3);
		nums.add(4);
		nums.add(2);
		JavaRDD<Integer> rdd = this.sparkCtx.parallelize(nums, 1);
		assertEquals(3, rdd.count());
	}
}
