#!/bin/sh

# 通过参数获取数据库地址
olddb=$1
newdb=$2


mongo $olddb -quiet finddb.js  > dbs.txt

string=`cat dbs.txt`
IFS=","
array=($string)
for var in ${array[@]}
do 
	mongo $olddb/$var -quiet index.js > indexs/$var.js 
	mongo $newdb/$var -quiet indexs/$var.js 
done
