package spark;

import static org.apache.spark.sql.functions.*;

import java.io.IOException;
import java.util.List;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.junit.Before;
import org.junit.Test;

public class CsvTest2 {
	private SparkSession sparkSession;

	@Before
	public void init() throws IllegalArgumentException, IOException {
		this.sparkSession = SparkSession.builder().master("local").appName("spark session example").getOrCreate();
	}

	@Test
	public void tesCsv() {
		Dataset<Row> dataset = this.sparkSession.read().format("csv").option("header", "true").option("", "")
				.load("/tmp/data2.csv");
		
		List<Row> l = dataset.collectAsList();
		// String title[] = { "Nome", "Nota" };
		for (Row row : l) {
			int s = row.length();
			for (int i = 0; i < s; i++) {
				// System.out.println(columns[i] + " : " + row.getString(i));
			}
		}
		String title[] = { "Nome", "stdDev(Nota)" };
		dataset.printSchema();
		Dataset<Row> stddev = dataset.groupBy("Nome").agg(stddev_pop("Nota"));
		System.out.println(stddev);
		l = stddev.collectAsList();
		for (Row row : l) {
			int s = row.length();
			for (int i = 0; i < s; i++) {
				Object value;
				try {
					value = row.getDouble(i);
				} catch (Exception e) {
					value = row.getString(i);
				}
				System.out.println(title[i] + " : " + value);
			}
		}
	}
}
