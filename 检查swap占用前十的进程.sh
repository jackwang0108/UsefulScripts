#! /bin/bash

function do_swap () {
  SUM=0
  OVERALL=0
  #获取进程目录
  for DIR in $(find /proc/ -maxdepth 1 -type d | grep -e "^/proc/[0-9]") ; do
        #获取进程PID
        PID=$(basename "$DIR")

        #获取进程名称
        PROGNAME=$(ps -p "$PID" -o comm --no-headers)

        #获取进程的所有分区中SWAP值
        for SWAP in $(grep Swap $DIR/smaps 2>/dev/null | awk '{ print $2 }'); do
              #进程swap值求和
              SUM=$(( SUM+ SWAP ))
        done

        if [[ $SUM -ne 0  ]]; then
            echo "PID=$PID - Swap used: $SUM - $PROGNAME"
        fi
        #总共swap分区值求和
        OVERALL=$(( OVERALL + SUM ))
        SUM=0 
  done
  echo "Overall swap used: $OVERALL"
 }


do_swap > tmp.txt
#查询结果排序并截取top10
awk -F[\ \(] '{print $5,$1,$7}' tmp.txt | sort -n | tail -10
tail -1 < tmp.txt
rm -rf tmp.txt
