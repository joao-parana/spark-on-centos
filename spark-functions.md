# spark-functions

## Aggregate functions

```scala
def approx_count_distinct(columnName: String, rsd: Double): Column
Aggregate function: returns the approximate number of distinct items in a group.
```

```scala
def approx_count_distinct(e: Column, rsd: Double): Column
Aggregate function: returns the approximate number of distinct items in a group.
```

```scala
def approx_count_distinct(columnName: String): Column
Aggregate function: returns the approximate number of distinct items in a group.
```

```scala
def approx_count_distinct(e: Column): Column
Aggregate function: returns the approximate number of distinct items in a group.
```

```scala
def avg(columnName: String): Column
Aggregate function: returns the average of the values in a group.
```

```scala
def avg(e: Column): Column
Aggregate function: returns the average of the values in a group.
```

```scala
def collect_list(columnName: String): Column
Aggregate function: returns a list of objects with duplicates.
```

```scala
def collect_list(e: Column): Column
Aggregate function: returns a list of objects with duplicates.
```

```scala
def collect_set(columnName: String): Column
Aggregate function: returns a set of objects with duplicate elements eliminated.
```

```scala
def collect_set(e: Column): Column
Aggregate function: returns a set of objects with duplicate elements eliminated.
```

```scala
def corr(columnName1: String, columnName2: String): Column
Aggregate function: returns the Pearson Correlation Coefficient for two columns.
```

```scala
def corr(column1: Column, column2: Column): Column
Aggregate function: returns the Pearson Correlation Coefficient for two columns.
```

```scala
def count(columnName: String): TypedColumn[Any, Long]
Aggregate function: returns the number of items in a group.
```

```scala
def count(e: Column): Column
Aggregate function: returns the number of items in a group.
```

```scala
def countDistinct(columnName: String, columnNames: String*): Column
Aggregate function: returns the number of distinct items in a group.
```

```scala
def countDistinct(expr: Column, exprs: Column*): Column
Aggregate function: returns the number of distinct items in a group.
```

```scala
def covar_pop(columnName1: String, columnName2: String): Column
Aggregate function: returns the population covariance for two columns.
```

```scala
def covar_pop(column1: Column, column2: Column): Column
Aggregate function: returns the population covariance for two columns.
```

```scala
def covar_samp(columnName1: String, columnName2: String): Column
Aggregate function: returns the sample covariance for two columns.
```

```scala
def covar_samp(column1: Column, column2: Column): Column
Aggregate function: returns the sample covariance for two columns.
```

```scala
def first(columnName: String): Column
Aggregate function: returns the first value of a column in a group.
```

```scala
def first(e: Column): Column
Aggregate function: returns the first value in a group.
```

```scala
def first(columnName: String, ignoreNulls: Boolean): Column
Aggregate function: returns the first value of a column in a group.
```

```scala
def first(e: Column, ignoreNulls: Boolean): Column
Aggregate function: returns the first value in a group.
```

```scala
def grouping(columnName: String): Column
Aggregate function: indicates whether a specified column in a GROUP BY list is aggregated or not, returns 1 for aggregated or 0 for not aggregated in the result set.
```

```scala
def grouping(e: Column): Column
Aggregate function: indicates whether a specified column in a GROUP BY list is aggregated or not, returns 1 for aggregated or 0 for not aggregated in the result set.
```

```scala
def grouping_id(colName: String, colNames: String*): Column
Aggregate function: returns the level of grouping, equals to
```

```scala
def grouping_id(cols: Column*): Column
Aggregate function: returns the level of grouping, equals to
```

```scala
def kurtosis(columnName: String): Column
Aggregate function: returns the kurtosis of the values in a group.
```

```scala
def kurtosis(e: Column): Column
Aggregate function: returns the kurtosis of the values in a group.
```

```scala
def last(columnName: String): Column
Aggregate function: returns the last value of the column in a group.
```

```scala
def last(e: Column): Column
Aggregate function: returns the last value in a group.
```

```scala
def last(columnName: String, ignoreNulls: Boolean): Column
Aggregate function: returns the last value of the column in a group.
```

```scala
def last(e: Column, ignoreNulls: Boolean): Column
Aggregate function: returns the last value in a group.
```

```scala
def max(columnName: String): Column
Aggregate function: returns the maximum value of the column in a group.
```

```scala
def max(e: Column): Column
Aggregate function: returns the maximum value of the expression in a group.
```

```scala
def mean(columnName: String): Column
Aggregate function: returns the average of the values in a group.
```

```scala
def mean(e: Column): Column
Aggregate function: returns the average of the values in a group.
```

```scala
def min(columnName: String): Column
Aggregate function: returns the minimum value of the column in a group.
```

```scala
def min(e: Column): Column
Aggregate function: returns the minimum value of the expression in a group.
```

```scala
def skewness(columnName: String): Column
Aggregate function: returns the skewness of the values in a group.
```

```scala
def skewness(e: Column): Column
Aggregate function: returns the skewness of the values in a group.
```

```scala
def stddev(columnName: String): Column
Aggregate function: alias for stddev_samp.
```

```scala
def stddev(e: Column): Column
Aggregate function: alias for stddev_samp.
```

```scala
def stddev_pop(columnName: String): Column
Aggregate function: returns the population standard deviation of the expression in a group.
```

```scala
def stddev_pop(e: Column): Column
Aggregate function: returns the population standard deviation of the expression in a group.
```

```scala
def stddev_samp(columnName: String): Column
Aggregate function: returns the sample standard deviation of the expression in a group.
```

```scala
def stddev_samp(e: Column): Column
Aggregate function: returns the sample standard deviation of the expression in a group.
```

```scala
def sum(columnName: String): Column
Aggregate function: returns the sum of all values in the given column.
```

```scala
def sum(e: Column): Column
Aggregate function: returns the sum of all values in the expression.
```

```scala
def sumDistinct(columnName: String): Column
Aggregate function: returns the sum of distinct values in the expression.
```

```scala
def sumDistinct(e: Column): Column
Aggregate function: returns the sum of distinct values in the expression.
```

```scala
def var_pop(columnName: String): Column
Aggregate function: returns the population variance of the values in a group.
```

```scala
def var_pop(e: Column): Column
Aggregate function: returns the population variance of the values in a group.
```

```scala
def var_samp(columnName: String): Column
Aggregate function: returns the unbiased variance of the values in a group.
```

```scala
def var_samp(e: Column): Column
Aggregate function: returns the unbiased variance of the values in a group.
```

```scala
def variance(columnName: String): Column
Aggregate function: alias for var_samp.
```

```scala
def variance(e: Column): Column
Aggregate function: alias for var_samp.
```

```scala
def approxCountDistinct(columnName: String, rsd: Double): Column
```

```scala
def approxCountDistinct(e: Column, rsd: Double): Column
```

```scala
def approxCountDistinct(columnName: String): Column
```

```scala
def approxCountDistinct(e: Column): Column
```

## Collection functions

```scala
def array_contains(column: Column, value: Any): Column
Returns true if the array contains value
```

```scala
def explode(e: Column): Column
Creates a new row for each element in the given array or map column.
```

```scala
def from_json(e: Column, schema: String, options: Map[String, String]): Column
Parses a column containing a JSON string into a StructType with the specified schema.
```

```scala
def from_json(e: Column, schema: StructType): Column
Parses a column containing a JSON string into a StructType with the specified schema.
```

```scala
def from_json(e: Column, schema: StructType, options: Map[String, String]): Column
(Java-specific) Parses a column containing a JSON string into a StructType with the specified schema.
```

```scala
def from_json(e: Column, schema: StructType, options: Map[String, String]): Column
(Scala-specific) Parses a column containing a JSON string into a StructType with the specified schema.
```

```scala
def get_json_object(e: Column, path: String): Column
Extracts json object from a json string based on json path specified, and returns json string of the extracted json object.
```

```scala
def json_tuple(json: Column, fields: String*): Column
Creates a new row for a json column according to the given field names.
```

```scala
def posexplode(e: Column): Column
Creates a new row for each element with position in the given array or map column.
```

```scala
def size(e: Column): Column
Returns length of array or map.
```

```scala
def sort_array(e: Column, asc: Boolean): Column
Sorts the input array for the given column in ascending or descending order, according to the natural ordering of the array elements.
```

```scala
def sort_array(e: Column): Column
Sorts the input array for the given column in ascending order, according to the natural ordering of the array elements.
```

```scala
def to_json(e: Column): Column
Converts a column containing a StructType into a JSON string with the specified schema.
```

```scala
def to_json(e: Column, options: Map[String, String]): Column
(Java-specific) Converts a column containing a StructType into a JSON string with the specified schema.
```

```scala
def to_json(e: Column, options: Map[String, String]): Column
(Scala-specific) Converts a column containing a StructType into a JSON string with the specified schema.
```

## Date time functions

```scala
def add_months(startDate: Column, numMonths: Int): Column
Returns the date that is numMonths after startDate.
```

```scala
def current_date(): Column
Returns the current date as a date column.
```

```scala
def current_timestamp(): Column
Returns the current timestamp as a timestamp column.
```

```scala
def date_add(start: Column, days: Int): Column
Returns the date that is days days after start
```

```scala
def date_format(dateExpr: Column, format: String): Column
Converts a date/timestamp/string to a value of string in the format specified by the date format given by the second argument.
```

```scala
def date_sub(start: Column, days: Int): Column
Returns the date that is days days before start
```

```scala
def datediff(end: Column, start: Column): Column
Returns the number of days from start to end.
```

```scala
def dayofmonth(e: Column): Column
Extracts the day of the month as an integer from a given date/timestamp/string.
```

```scala
def dayofyear(e: Column): Column
Extracts the day of the year as an integer from a given date/timestamp/string.
```

```scala
def from_unixtime(ut: Column, f: String): Column
Converts the number of seconds from unix epoch (1970-01-01 00:00:00 UTC) to a string representing the timestamp of that moment in the current system time zone in the given format.
```

```scala
def from_unixtime(ut: Column): Column
Converts the number of seconds from unix epoch (1970-01-01 00:00:00 UTC) to a string representing the timestamp of that moment in the current system time zone in the given format.
```

```scala
def from_utc_timestamp(ts: Column, tz: String): Column
Given a timestamp, which corresponds to a certain time of day in UTC, returns another timestamp that corresponds to the same time of day in the given timezone.
```

```scala
def hour(e: Column): Column
Extracts the hours as an integer from a given date/timestamp/string.
```

```scala
def last_day(e: Column): Column
Given a date column, returns the last day of the month which the given date belongs to.
```

```scala
def minute(e: Column): Column
Extracts the minutes as an integer from a given date/timestamp/string.
```

```scala
def month(e: Column): Column
Extracts the month as an integer from a given date/timestamp/string.
```

```scala
def months_between(date1: Column, date2: Column): Column
Returns number of months between dates date1 and date2.
```

```scala
def next_day(date: Column, dayOfWeek: String): Column
Given a date column, returns the first date which is later than the value of the date column that is on the specified day of the week.
```

```scala
def quarter(e: Column): Column
Extracts the quarter as an integer from a given date/timestamp/string.
```

```scala
def second(e: Column): Column
Extracts the seconds as an integer from a given date/timestamp/string.
```

```scala
def to_date(e: Column): Column
Converts the column into DateType.
```

```scala
def to_utc_timestamp(ts: Column, tz: String): Column
Given a timestamp, which corresponds to a certain time of day in the given timezone, returns another timestamp that corresponds to the same time of day in UTC.
```

```scala
def trunc(date: Column, format: String): Column
Returns date truncated to the unit specified by the format.
```

```scala
def unix_timestamp(s: Column, p: String): Column
Convert time string with given pattern (see [http://docs.oracle.com/javase/tutorial/i18n/format/simpleDateFormat.html]) to Unix time stamp (in seconds), return null if fail.
```

```scala
def unix_timestamp(s: Column): Column
Converts time string in format yyyy-MM-dd HH:mm:ss to Unix timestamp (in seconds), using the default timezone and the default locale, return null if fail.
```

```scala
def unix_timestamp(): Column
Gets current Unix timestamp in seconds.
```

```scala
def weekofyear(e: Column): Column
Extracts the week number as an integer from a given date/timestamp/string.
Experimental def
window(timeColumn: Column, windowDuration: String): Column
Generates tumbling time windows given a timestamp specifying column.
Experimental def
window(timeColumn: Column, windowDuration: String, slideDuration: String): Column
Bucketize rows into one or more time windows given a timestamp specifying column.
Experimental def
window(timeColumn: Column, windowDuration: String, slideDuration: String, startTime: String): Column
Bucketize rows into one or more time windows given a timestamp specifying column.
```

```scala
def year(e: Column): Column
Extracts the year as an integer from a given date/timestamp/string.
```

## Math functions

```scala
def acos(columnName: String): Column
Computes the cosine inverse of the given column; the returned angle is in the range 0.0 through pi.
```

```scala
def acos(e: Column): Column
Computes the cosine inverse of the given value; the returned angle is in the range 0.0 through pi.
```

```scala
def asin(columnName: String): Column
Computes the sine inverse of the given column; the returned angle is in the range -pi/2 through pi/2.
```

```scala
def asin(e: Column): Column
Computes the sine inverse of the given value; the returned angle is in the range -pi/2 through pi/2.
```

```scala
def atan(columnName: String): Column
Computes the tangent inverse of the given column.
```

```scala
def atan(e: Column): Column
Computes the tangent inverse of the given value.
```

```scala
def atan2(l: Double, rightName: String): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def atan2(l: Double, r: Column): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def atan2(leftName: String, r: Double): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def atan2(l: Column, r: Double): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def atan2(leftName: String, rightName: String): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def atan2(leftName: String, r: Column): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def atan2(l: Column, rightName: String): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def atan2(l: Column, r: Column): Column
Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
```

```scala
def bin(columnName: String): Column
An expression that returns the string representation of the binary value of the given long column.
```

```scala
def bin(e: Column): Column
An expression that returns the string representation of the binary value of the given long column.
```

```scala
def bround(e: Column, scale: Int): Column
Round the value of e to scale decimal places with HALF_EVEN round mode if scale is greater than or equal to 0 or at integral part when scale is less than 0.
```

```scala
def bround(e: Column): Column
Returns the value of the column e rounded to 0 decimal places with HALF_EVEN round mode.
```

```scala
def cbrt(columnName: String): Column
Computes the cube-root of the given column.
```

```scala
def cbrt(e: Column): Column
Computes the cube-root of the given value.
```

```scala
def ceil(columnName: String): Column
Computes the ceiling of the given column.
```

```scala
def ceil(e: Column): Column
Computes the ceiling of the given value.
```

```scala
def conv(num: Column, fromBase: Int, toBase: Int): Column
Convert a number in a string column from one base to another.
```

```scala
def cos(columnName: String): Column
Computes the cosine of the given column.
```

```scala
def cos(e: Column): Column
Computes the cosine of the given value.
```

```scala
def cosh(columnName: String): Column
Computes the hyperbolic cosine of the given column.
```

```scala
def cosh(e: Column): Column
Computes the hyperbolic cosine of the given value.
```

```scala
def degrees(columnName: String): Column
Converts an angle measured in radians to an approximately equivalent angle measured in degrees.
```

```scala
def degrees(e: Column): Column
Converts an angle measured in radians to an approximately equivalent angle measured in degrees.
```

```scala
def exp(columnName: String): Column
Computes the exponential of the given column.
```

```scala
def exp(e: Column): Column
Computes the exponential of the given value.
```

```scala
def expm1(columnName: String): Column
Computes the exponential of the given column.
```

```scala
def expm1(e: Column): Column
Computes the exponential of the given value minus one.
```

```scala
def factorial(e: Column): Column
Computes the factorial of the given value.
```

```scala
def floor(columnName: String): Column
Computes the floor of the given column.
```

```scala
def floor(e: Column): Column
Computes the floor of the given value.
```

```scala
def hex(column: Column): Column
Computes hex value of the given column.
```

```scala
def hypot(l: Double, rightName: String): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def hypot(l: Double, r: Column): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def hypot(leftName: String, r: Double): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def hypot(l: Column, r: Double): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def hypot(leftName: String, rightName: String): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def hypot(leftName: String, r: Column): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def hypot(l: Column, rightName: String): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def hypot(l: Column, r: Column): Column
Computes sqrt(a2 + b2) without intermediate overflow or underflow.
```

```scala
def log(base: Double, columnName: String): Column
Returns the first argument-base logarithm of the second argument.
```

```scala
def log(base: Double, a: Column): Column
Returns the first argument-base logarithm of the second argument.
```

```scala
def log(columnName: String): Column
Computes the natural logarithm of the given column.
```

```scala
def log(e: Column): Column
Computes the natural logarithm of the given value.
```

```scala
def log10(columnName: String): Column
Computes the logarithm of the given value in base 10.
```

```scala
def log10(e: Column): Column
Computes the logarithm of the given value in base 10.
```

```scala
def log1p(columnName: String): Column
Computes the natural logarithm of the given column plus one.
```

```scala
def log1p(e: Column): Column
Computes the natural logarithm of the given value plus one.
```

```scala
def log2(columnName: String): Column
Computes the logarithm of the given value in base 2.
```

```scala
def log2(expr: Column): Column
Computes the logarithm of the given column in base 2.
```

```scala
def pmod(dividend: Column, divisor: Column): Column
Returns the positive value of dividend mod divisor.
```

```scala
def pow(l: Double, rightName: String): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def pow(l: Double, r: Column): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def pow(leftName: String, r: Double): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def pow(l: Column, r: Double): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def pow(leftName: String, rightName: String): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def pow(leftName: String, r: Column): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def pow(l: Column, rightName: String): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def pow(l: Column, r: Column): Column
Returns the value of the first argument raised to the power of the second argument.
```

```scala
def radians(columnName: String): Column
Converts an angle measured in degrees to an approximately equivalent angle measured in radians.
```

```scala
def radians(e: Column): Column
Converts an angle measured in degrees to an approximately equivalent angle measured in radians.
```

```scala
def rint(columnName: String): Column
Returns the double value that is closest in value to the argument and is equal to a mathematical integer.
```

```scala
def rint(e: Column): Column
Returns the double value that is closest in value to the argument and is equal to a mathematical integer.
```

```scala
def round(e: Column, scale: Int): Column
Round the value of e to scale decimal places if scale is greater than or equal to 0 or at integral part when scale is less than 0.
```

```scala
def round(e: Column): Column
Returns the value of the column e rounded to 0 decimal places.
```

```scala
def shiftLeft(e: Column, numBits: Int): Column
Shift the given value numBits left.
```

```scala
def shiftRight(e: Column, numBits: Int): Column
(Signed) shift the given value numBits right.
```

```scala
def shiftRightUnsigned(e: Column, numBits: Int): Column
Unsigned shift the given value numBits right.
```

```scala
def signum(columnName: String): Column
Computes the signum of the given column.
```

```scala
def signum(e: Column): Column
Computes the signum of the given value.
```

```scala
def sin(columnName: String): Column
Computes the sine of the given column.
```

```scala
def sin(e: Column): Column
Computes the sine of the given value.
```

```scala
def sinh(columnName: String): Column
Computes the hyperbolic sine of the given column.
```

```scala
def sinh(e: Column): Column
Computes the hyperbolic sine of the given value.
```

```scala
def sqrt(colName: String): Column
Computes the square root of the specified float value.
```

```scala
def sqrt(e: Column): Column
Computes the square root of the specified float value.
```

```scala
def tan(columnName: String): Column
Computes the tangent of the given column.
```

```scala
def tan(e: Column): Column
Computes the tangent of the given value.
```

```scala
def tanh(columnName: String): Column
Computes the hyperbolic tangent of the given column.
```

```scala
def tanh(e: Column): Column
Computes the hyperbolic tangent of the given value.
```

```scala
def unhex(column: Column): Column
Inverse of hex.
```

```scala
def toDegrees(columnName: String): Column
```

```scala
def toDegrees(e: Column): Column
```

```scala
def toRadians(columnName: String): Column
```

```scala
def toRadians(e: Column): Column
```

## Misc functions

```scala
def crc32(e: Column): Column
Calculates the cyclic redundancy check value (CRC32) of a binary column and returns the value as a bigint.
```

```scala
def hash(cols: Column*): Column
Calculates the hash code of given columns, and returns the result as an int column.
```

```scala
def md5(e: Column): Column
Calculates the MD5 digest of a binary column and returns the value as a 32 character hex string.
```

```scala
def sha1(e: Column): Column
Calculates the SHA-1 digest of a binary column and returns the value as a 40 character hex string.
```

```scala
def sha2(e: Column, numBits: Int): Column
Calculates the SHA-2 family of hash functions of a binary column and returns the value as a hex string.
```

## Non-aggregate functions

```scala
def abs(e: Column): Column
Computes the absolute value.
```

```scala
def array(colName: String, colNames: String*): Column
Creates a new array column.
```

```scala
def array(cols: Column*): Column
Creates a new array column.
```

```scala
def bitwiseNOT(e: Column): Column
Computes bitwise NOT.
```

```scala
def broadcast[T](df: Dataset[T]): Dataset[T]
Marks a DataFrame as small enough for use in broadcast joins.
```

```scala
def coalesce(e: Column*): Column
Returns the first column that is not null, or null if all inputs are null.
```

```scala
def col(colName: String): Column
Returns a Column based on the given column name.
```

```scala
def column(colName: String): Column
Returns a Column based on the given column name.
```

```scala
def expr(expr: String): Column
Parses the expression string into the column that it represents, similar to DataFrame.selectExpr
```

```scala
def greatest(columnName: String, columnNames: String*): Column
Returns the greatest value of the list of column names, skipping null values.
```

```scala
def greatest(exprs: Column*): Column
Returns the greatest value of the list of values, skipping null values.
```

```scala
def input_file_name(): Column
Creates a string column for the file name of the current Spark task.
```

```scala
def isnan(e: Column): Column
Return true iff the column is NaN.
```

```scala
def isnull(e: Column): Column
Return true iff the column is null.
```

```scala
def least(columnName: String, columnNames: String*): Column
Returns the least value of the list of column names, skipping null values.
```

```scala
def least(exprs: Column*): Column
Returns the least value of the list of values, skipping null values.
```

```scala
def lit(literal: Any): Column
Creates a Column of literal value.
```

```scala
def map(cols: Column*): Column
Creates a new map column.
```

```scala
def monotonically_increasing_id(): Column
A column expression that generates monotonically increasing 64-bit integers.
```

```scala
def nanvl(col1: Column, col2: Column): Column
Returns col1 if it is not NaN, or col2 if col1 is NaN.
```

```scala
def negate(e: Column): Column
Unary minus, i.e.
```

```scala
def not(e: Column): Column
Inversion of boolean expression, i.e.
```

```scala
def rand(): Column
Generate a random column with independent and identically distributed (i.i.d.) samples from U[0.0, 1.0].
```

```scala
def rand(seed: Long): Column
Generate a random column with independent and identically distributed (i.i.d.) samples from U[0.0, 1.0].
```

```scala
def randn(): Column
Generate a column with independent and identically distributed (i.i.d.) samples from the standard normal distribution.
```

```scala
def randn(seed: Long): Column
Generate a column with independent and identically distributed (i.i.d.) samples from the standard normal distribution.
```

```scala
def spark_partition_id(): Column
Partition ID.
```

```scala
def struct(colName: String, colNames: String*): Column
Creates a new struct column that composes multiple input columns.
```

```scala
def struct(cols: Column*): Column
Creates a new struct column.
```

```scala
def when(condition: Column, value: Any): Column
Evaluates a list of conditions and returns one of multiple possible result expressions.
```

```scala
def monotonicallyIncreasingId(): Column
A column expression that generates monotonically increasing 64-bit integers.
```

## Sorting functions

```scala
def asc(columnName: String): Column
Returns a sort expression based on ascending order of the column.
```

```scala
def asc_nulls_first(columnName: String): Column
Returns a sort expression based on ascending order of the column, and null values return before non-null values.
```

```scala
def asc_nulls_last(columnName: String): Column
Returns a sort expression based on ascending order of the column, and null values appear after non-null values.
```

```scala
def desc(columnName: String): Column
Returns a sort expression based on the descending order of the column.
```

```scala
def desc_nulls_first(columnName: String): Column
Returns a sort expression based on the descending order of the column, and null values appear before non-null values.
```

```scala
def desc_nulls_last(columnName: String): Column
Returns a sort expression based on the descending order of the column, and null values appear after non-null values.
```

## String functions

```scala
def ascii(e: Column): Column
Computes the numeric value of the first character of the string column, and returns the result as an int column.
```

```scala
def base64(e: Column): Column
Computes the BASE64 encoding of a binary column and returns it as a string column.
```

```scala
def concat(exprs: Column*): Column
Concatenates multiple input string columns together into a single string column.
```

```scala
def concat_ws(sep: String, exprs: Column*): Column
Concatenates multiple input string columns together into a single string column, using the given separator.
```

```scala
def decode(value: Column, charset: String): Column
Computes the first argument into a string from a binary using the provided character set (one of 'US-ASCII', 'ISO-8859-1', 'UTF-8', 'UTF-16BE', 'UTF-16LE', 'UTF-16').
```

```scala
def encode(value: Column, charset: String): Column
Computes the first argument into a binary from a string using the provided character set (one of 'US-ASCII', 'ISO-8859-1', 'UTF-8', 'UTF-16BE', 'UTF-16LE', 'UTF-16').
```

```scala
def format_number(x: Column, d: Int): Column
Formats numeric column x to a format like '#,###,###.##', rounded to d decimal places, and returns the result as a string column.
```

```scala
def format_string(format: String, arguments: Column*): Column
Formats the arguments in printf-style and returns the result as a string column.
```

```scala
def initcap(e: Column): Column
Returns a new string column by converting the first letter of each word to uppercase.
```

```scala
def instr(str: Column, substring: String): Column
Locate the position of the first occurrence of substr column in the given string.
```

```scala
def length(e: Column): Column
Computes the length of a given string or binary column.
```

```scala
def levenshtein(l: Column, r: Column): Column
Computes the Levenshtein distance of the two given string columns.
```

```scala
def locate(substr: String, str: Column, pos: Int): Column
Locate the position of the first occurrence of substr in a string column, after position pos.
```

```scala
def locate(substr: String, str: Column): Column
Locate the position of the first occurrence of substr.
```

```scala
def lower(e: Column): Column
Converts a string column to lower case.
```

```scala
def lpad(str: Column, len: Int, pad: String): Column
Left-pad the string column with
```

```scala
def ltrim(e: Column): Column
Trim the spaces from left end for the specified string value.
```

```scala
def regexp_extract(e: Column, exp: String, groupIdx: Int): Column
Extract a specific group matched by a Java regex, from the specified string column.
```

```scala
def regexp_replace(e: Column, pattern: Column, replacement: Column): Column
Replace all substrings of the specified string value that match regexp with rep.
```

```scala
def regexp_replace(e: Column, pattern: String, replacement: String): Column
Replace all substrings of the specified string value that match regexp with rep.
```

```scala
def repeat(str: Column, n: Int): Column
Repeats a string column n times, and returns it as a new string column.
```

```scala
def reverse(str: Column): Column
Reverses the string column and returns it as a new string column.
```

```scala
def rpad(str: Column, len: Int, pad: String): Column
Right-padded with pad to a length of len.
```

```scala
def rtrim(e: Column): Column
Trim the spaces from right end for the specified string value.
```

```scala
def soundex(e: Column): Column
* Return the soundex code for the specified expression.
```

```scala
def split(str: Column, pattern: String): Column
Splits str around pattern (pattern is a regular expression).
```

```scala
def substring(str: Column, pos: Int, len: Int): Column
Substring starts at pos and is of length len when str is String type or returns the slice of byte array that starts at pos in byte and is of length len when str is Binary type
```

```scala
def substring_index(str: Column, delim: String, count: Int): Column
Returns the substring from string str before count occurrences of the delimiter delim.
```

```scala
def translate(src: Column, matchingString: String, replaceString: String): Column
Translate any character in the src by a character in replaceString.
```

```scala
def trim(e: Column): Column
Trim the spaces from both ends for the specified string column.
```

```scala
def unbase64(e: Column): Column
Decodes a BASE64 encoded string column and returns it as a binary column.
```

```scala
def upper(e: Column): Column
Converts a string column to upper case.
```

## UDF functions

```scala
def callUDF(udfName: String, cols: Column*): Column
Call an user-defined function.
```

```scala
def udf(f: AnyRef, dataType: DataType): UserDefinedFunction
Defines a user-defined function (UDF) using a Scala closure.
```

```scala
def udf[RT, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10](f: (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3], arg4: scala.reflect.api.JavaUniverse.TypeTag[A4], arg5: scala.reflect.api.JavaUniverse.TypeTag[A5], arg6: scala.reflect.api.JavaUniverse.TypeTag[A6], arg7: scala.reflect.api.JavaUniverse.TypeTag[A7], arg8: scala.reflect.api.JavaUniverse.TypeTag[A8], arg9: scala.reflect.api.JavaUniverse.TypeTag[A9], arg10: scala.reflect.api.JavaUniverse.TypeTag[A10]): UserDefinedFunction
Defines a user-defined function of 10 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2, A3, A4, A5, A6, A7, A8, A9](f: (A1, A2, A3, A4, A5, A6, A7, A8, A9) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3], arg4: scala.reflect.api.JavaUniverse.TypeTag[A4], arg5: scala.reflect.api.JavaUniverse.TypeTag[A5], arg6: scala.reflect.api.JavaUniverse.TypeTag[A6], arg7: scala.reflect.api.JavaUniverse.TypeTag[A7], arg8: scala.reflect.api.JavaUniverse.TypeTag[A8], arg9: scala.reflect.api.JavaUniverse.TypeTag[A9]): UserDefinedFunction
Defines a user-defined function of 9 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2, A3, A4, A5, A6, A7, A8](f: (A1, A2, A3, A4, A5, A6, A7, A8) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3], arg4: scala.reflect.api.JavaUniverse.TypeTag[A4], arg5: scala.reflect.api.JavaUniverse.TypeTag[A5], arg6: scala.reflect.api.JavaUniverse.TypeTag[A6], arg7: scala.reflect.api.JavaUniverse.TypeTag[A7], arg8: scala.reflect.api.JavaUniverse.TypeTag[A8]): UserDefinedFunction
Defines a user-defined function of 8 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2, A3, A4, A5, A6, A7](f: (A1, A2, A3, A4, A5, A6, A7) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3], arg4: scala.reflect.api.JavaUniverse.TypeTag[A4], arg5: scala.reflect.api.JavaUniverse.TypeTag[A5], arg6: scala.reflect.api.JavaUniverse.TypeTag[A6], arg7: scala.reflect.api.JavaUniverse.TypeTag[A7]): UserDefinedFunction
Defines a user-defined function of 7 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2, A3, A4, A5, A6](f: (A1, A2, A3, A4, A5, A6) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3], arg4: scala.reflect.api.JavaUniverse.TypeTag[A4], arg5: scala.reflect.api.JavaUniverse.TypeTag[A5], arg6: scala.reflect.api.JavaUniverse.TypeTag[A6]): UserDefinedFunction
Defines a user-defined function of 6 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2, A3, A4, A5](f: (A1, A2, A3, A4, A5) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3], arg4: scala.reflect.api.JavaUniverse.TypeTag[A4], arg5: scala.reflect.api.JavaUniverse.TypeTag[A5]): UserDefinedFunction
Defines a user-defined function of 5 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2, A3, A4](f: (A1, A2, A3, A4) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3], arg4: scala.reflect.api.JavaUniverse.TypeTag[A4]): UserDefinedFunction
Defines a user-defined function of 4 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2, A3](f: (A1, A2, A3) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2], arg3: scala.reflect.api.JavaUniverse.TypeTag[A3]): UserDefinedFunction
Defines a user-defined function of 3 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1, A2](f: (A1, A2) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1], arg2: scala.reflect.api.JavaUniverse.TypeTag[A2]): UserDefinedFunction
Defines a user-defined function of 2 arguments as user-defined function (UDF).
```

```scala
def udf[RT, A1](f: (A1) ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT], arg1: scala.reflect.api.JavaUniverse.TypeTag[A1]): UserDefinedFunction
Defines a user-defined function of 1 arguments as user-defined function (UDF).
```

```scala
def udf[RT](f: () ⇒ RT)(implicit arg0: scala.reflect.api.JavaUniverse.TypeTag[RT]): UserDefinedFunction
Defines a user-defined function of 0 arguments as user-defined function (UDF).
```

## Window functions

```scala
def cume_dist(): Column
Window function: returns the cumulative distribution of values within a window partition, i.e.
```

```scala
def dense_rank(): Column
Window function: returns the rank of rows within a window partition, without any gaps.
```

```scala
def lag(e: Column, offset: Int, defaultValue: Any): Column
Window function: returns the value that is offset rows before the current row, and defaultValue if there is less than offset rows before the current row.
```

```scala
def lag(columnName: String, offset: Int, defaultValue: Any): Column
Window function: returns the value that is offset rows before the current row, and defaultValue if there is less than offset rows before the current row.
```

```scala
def lag(columnName: String, offset: Int): Column
Window function: returns the value that is offset rows before the current row, and null if there is less than offset rows before the current row.
```

```scala
def lag(e: Column, offset: Int): Column
Window function: returns the value that is offset rows before the current row, and null if there is less than offset rows before the current row.
```

```scala
def lead(e: Column, offset: Int, defaultValue: Any): Column
Window function: returns the value that is offset rows after the current row, and defaultValue if there is less than offset rows after the current row.
```

```scala
def lead(columnName: String, offset: Int, defaultValue: Any): Column
Window function: returns the value that is offset rows after the current row, and defaultValue if there is less than offset rows after the current row.
```

```scala
def lead(e: Column, offset: Int): Column
Window function: returns the value that is offset rows after the current row, and null if there is less than offset rows after the current row.
```

```scala
def lead(columnName: String, offset: Int): Column
Window function: returns the value that is offset rows after the current row, and null if there is less than offset rows after the current row.
```

```scala
def ntile(n: Int): Column
Window function: returns the ntile group id (from 1 to n inclusive) in an ordered window partition.
```

```scala
def percent_rank(): Column
Window function: returns the relative rank (i.e.
```

```scala
def rank(): Column
Window function: returns the rank of rows within a window partition.
```

```scala
def row_number(): Column
Window function: returns a sequential number starting at 1 within a window partition.
```
