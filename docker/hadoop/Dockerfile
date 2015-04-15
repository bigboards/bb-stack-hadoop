FROM bigboards/java-7-armv7l

MAINTAINER bigboards

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

#RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-7-oracle\nexport HADOOP_PREFIX=/opt/hadoop\nexport HADOOP_HOME=/opt/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
#RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

#RUN mkdir $HADOOP_PREFIX/input
#RUN cp $HADOOP_PREFIX/etc/hadoop/*.xml $HADOOP_PREFIX/input

# -- files are being installed using ansible. This means the container and software is installed as a docker repository,
# -- while the configuration is mounted as a volume.
#ADD files/core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
#ADD files/log4j.properties $HADOOP_PREFIX/etc/hadoop/log4j.properties
#ADD files/hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
# ADD /etc/hosts /etc/hosts

# fixing the libhadoop.so like a boss
# RUN rm  /usr/local/hadoop/lib/native/*
# RUN curl -Ls http://dl.bintray.com/sequenceiq/sequenceiq-bin/hadoop-native-64-2.5.0.tar|tar -xz -C /usr/local/hadoop/lib/native/

# workingaround docker.io build error
#RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh
#RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
#RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh

#{% if ansible_fqdn in groups['host-coordinators'] %}
#RUN $HADOOP_PREFIX/bin/hdfs namenode -format {{ ansible_local.hex.name }}
#{% endif %}

# copy the format script
ADD hdfs-namenode-wrapper.sh /opt/hadoop/bin/hdfs-namenode-wrapper.sh
RUN chmod u+x /opt/hadoop/bin/hdfs-namenode-wrapper.sh


#          namenode              datanode                resourcemanager       nodemanager
#       +--------------+ +-------------------------+ +----------------------+ +------------+
#EXPOSE 8020 50070 50470 50010 1004 50075 1006 50020 8030 8031 8032 8033 8088 8040 8041 8042

CMD ["/bin/bash"]