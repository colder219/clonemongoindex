#!/bin/sh


# 提前写好对照表，一次性把所有的库的索引拷贝完，威力大，风险高
for dbs in `cat dblist.txt`
do
	# 每个实例输出之前清空之前生成的创建索引语句
 	rm -rf indexs/*
	odb=`echo $dbs|/usr/bin/cut -d , -f 1`
	ndb=`echo $dbs|/usr/bin/cut -d , -f 2`

 	mongo $olddb -quiet finddb.js  > dbs.txt
 	
 	string=`cat dbs.txt`
 	# 分隔符
 	IFS=","
 	array=($string)
 	for var in ${array[@]}
 	do 
 		mongo $olddb/$var -quiet index.js > indexs/$var.js 
 		mongo $newdb/$var -quiet indexs/$var.js 
 	done
done
