FROM charliek/openjdk-jre-7
MAINTAINER F4 <dev@f4-group.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y wget

#install logstash
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar -O /opt/logstash.jar --no-check-certificate
ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN rm -rf /tmp/*

#elastic search
EXPOSE 9200
EXPOSE 9300

#logstash ui
EXPOSE 9292

#syslog
#EXPOSE 514

#gelf udp
EXPOSE 12201/udp
CMD ["/usr/local/bin/run"]
