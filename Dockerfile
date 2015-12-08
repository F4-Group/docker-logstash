FROM java:8
MAINTAINER F4 <dev@f4-group.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y wget
#install logstash
RUN wget -q https://download.elastic.co/logstash/logstash/logstash-1.4.4.tar.gz -O /tmp/logstash.tar.gz && \
    (cd /tmp && tar zxf logstash.tar.gz && mv logstash-1.4.4 /opt/logstash && \
    rm logstash.tar.gz)

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
ADD logstash.conf.template /opt/logstash.conf.template

#elasticsearch data
EXPOSE 9200
#elasticsearch control - useful for node discovery
EXPOSE 9300

#syslog
EXPOSE 514

#gelf udp
EXPOSE 12201/udp

#log4j
EXPOSE 9500

#save logstash data on docker volume to avoid losing it on restart
VOLUME ["/data/elasticsearch"]
CMD ["/usr/local/bin/run"]
