FROM bigboards/java-7-__arch__

MAINTAINER bigboards <hello@bigboards.io>

USER root

# hadoop
RUN curl -s http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./hadoop-2.6.0 hadoop

ENV HADOOP_PREFIX /opt/hadoop
ENV YARN_HOME /opt/hadoop
ENV HADOOP_YARN_HOME /opt/hadoop
ENV HADOOP_HDFS_HOME /opt/hadoop
ENV HADOOP_COMMON_HOME /opt/hadoop
ENV HADOOP_MAPRED_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV HDFS_CONF_DIR /opt/hadoop/etc/hadoop
ENV YARN_CONF_DIR /opt/hadoop/etc/hadoop

# copy the format script
ADD hdfs-namenode-wrapper.sh /opt/hadoop/bin/hdfs-namenode-wrapper.sh
RUN chmod u+x /opt/hadoop/bin/hdfs-namenode-wrapper.sh


#          namenode              datanode                resourcemanager       nodemanager
#       +--------------+ +-------------------------+ +----------------------+ +------------+
#EXPOSE 8020 50070 50470 50010 1004 50075 1006 50020 8030 8031 8032 8033 8088 8040 8041 8042

CMD ["/bin/bash"]