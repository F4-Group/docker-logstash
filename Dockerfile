FROM charliek/openjdk-jre-7
MAINTAINER F4 <dev@f4-group.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y wget
#install logstash
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -O /tmp/logstash.tar.gz && \
    (cd /tmp && tar zxf logstash.tar.gz && mv logstash-1.4.2 /opt/logstash && \
    rm logstash.tar.gz)

ADD logstash.conf /opt/logstash.conf

#elasticsearch
EXPOSE 9200
#EXPOSE 9300

#kibana
EXPOSE 9292

#syslog
#EXPOSE 514

#gelf udp
EXPOSE 12201/udp

#save logstash data on docker volume to avoid losing it on restart
VOLUME ["/data/elasticsearch"]
CMD /opt/logstash/bin/logstash agent -f /opt/logstash.conf -- web
