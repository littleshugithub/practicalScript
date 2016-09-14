#!/bin/bash
host=127.0.0.1
port=5432
db=otmscore
dbuser=jetty
dbpwd=jetty

init_local(){
  host=127.0.0.1
  port=5432
  db=otmscore
  dbuser=jetty
  dbpwd=jetty
}

init_88(){
  host=192.168.3.88
  port=5432
  db=otms
  dbuser=jetty
  dbpwd=jetty
}


#config db info
if [ "$1" = "88" ]
then
  init_88
  echo $host
fi

dir=$(ls -l . |awk '/^.*\.sql$/ {print $NF}')
for i in $dir
do
    # echo $i
    psql -f $i -h $host -p $port "dbname=$db user=$dbuser password=$dbpwd"
done
