CREATE EXTERNAL TABLE distancecalc(
  src_lat double,
  src_long double,
  dest_lat double,
  dest_long double)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://sandbox.hortonworks.com:8020/tmp/dist2'
TBLPROPERTIES (
  'COLUMN_STATS_ACCURATE'='false',
  'numFiles'='1',
  'numRows'='-1',
  'rawDataSize'='-1',
  'totalSize'='338',
  'transient_lastDdlTime'='1458866694')
  ;

select src_lat, src_long, dest_lat, dest_long, 
60*1.1515*(180*(acos(((sin(radians(src_lat))*sin(radians(dest_lat))) + (cos(radians(src_lat))*cos(radians(dest_lat))*cos(radians(src_long-dest_long))))))/PI()) as distancecalc 
from distancecalc;
