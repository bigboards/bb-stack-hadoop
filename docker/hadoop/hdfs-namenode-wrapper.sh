#!/bin/bash
HDFS_FORMAT_MARKER="/opt/hadoop/etc/hadoop/hdfs.format"
DAEMON=$1

if [ -e "$HDFS_FORMAT_MARKER" ]; then
    echo "Found the HDFS format marker. Formatting hdfs before starting";

    /opt/hadoop/bin/hadoop --config /opt/hadoop/etc/hadoop namenode -format -force -nonInteractive

    if [ $? -eq 0 ]; then
        rm -rf "$HDFS_FORMAT_MARKER"
    fi
fi

if [ ! -e "$HDFS_FORMAT_MARKER" ]; then
    /opt/hadoop/bin/hdfs --config /opt/hadoop/etc/hadoop namenode
fi
