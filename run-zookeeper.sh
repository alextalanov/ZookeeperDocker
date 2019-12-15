#!/bin/sh

while [[ $1 ]]; do
case $1 in
     --myid)
          shift
          MYID=$1
          shift
          ;;
     --config)
          shift
          CONFIG=$1
          shift
          ;;
     *)
          echo "'$1' arg is not supported"
          exit 1
          ;;
esac
done

if [[ ! $MYID ]]; then
	echo '--myid must be passed'
	exit 1
fi

if [[ ! $CONFIG ]]; then
     CONFIG=$ZOO_HOME/conf/zoo.cfg
fi

echo "Config file path: $CONFIG"

DATA_DIR=$(cat $CONFIG | grep 'dataDir' | cut -d = -f 2)

echo "Data dir path: $DATA_DIR"

if [[ ! -d $DATA_DIR ]]; then
     zkServer-initialize.sh --myid=$MYID
fi

zkServer.sh start-foreground "$CONFIG"
