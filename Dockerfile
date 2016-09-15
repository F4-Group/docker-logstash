FROM java:8
MAINTAINER F4 <dev@f4-group.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y wget
#install logstash
RUN wget -q https://download.elastic.co/logstash/logstash/logstash-2.4.0.tar.gz -O /tmp/logstash.tar.gz && \
    (cd /tmp && tar zxf logstash.tar.gz && mv logstash-2.4.0 /opt/logstash && \
    rm logstash.tar.gz)

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
ADD logstash.conf.template /opt/logstash.conf.template

RUN git clone -b plugin-api-v1 --depth 1 https://github.com/F4-Group/logstash-input-gelf.git /custom/logstash-input-gelf
RUN sed -i 's|gem "logstash-input-gelf".*$|gem "logstash-input-gelf", :path => "/custom/logstash-input-gelf"|' /opt/logstash/Gemfile
RUN /opt/logstash/bin/logstash-plugin install logstash-input-gelf

#syslog
EXPOSE 514

#gelf udp
EXPOSE 12201/udp

#log4j
EXPOSE 9500

CMD ["/usr/local/bin/run"]
