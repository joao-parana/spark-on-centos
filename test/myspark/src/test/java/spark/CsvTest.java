package spark;

import static org.apache.spark.sql.functions.*;

import java.io.IOException;
import java.util.List;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.junit.Before;
import org.junit.Test;

public class CsvTest {
	private SparkSession sparkSession;

	@Before
	public void init() throws IllegalArgumentException, IOException {
		this.sparkSession = SparkSession.builder().master("local").appName("spark session example").getOrCreate();
	}

	@Test
	public void tesCsv() {
		Dataset<Row> dataset = this.sparkSession.read().format("csv").option("header", "true").option("", "")
				.load("/tmp/data.csv");
		
		List<Row> l = dataset.collectAsList();
		String columns[] = { "Nome", "Idade" };
		for (Row row : l) {
			int s = row.length();
			for (int i = 0; i < s; i++) {
				System.out.println(columns[i] + " : " + row.getString(i));
			}
		}
		dataset.printSchema();
	}
}
