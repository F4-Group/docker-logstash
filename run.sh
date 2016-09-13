#!/bin/bash
ES_HOSTS=${ES_HOSTS:-[\"127.0.0.1:9200\"]}
export LS_HEAP_SIZE=${LS_HEAP_SIZE:-24g}

sed "s/%ES_CONF%/\n    hosts => $ES_HOSTS\n/g" /opt/logstash.conf.template > /opt/logstash.conf

/opt/logstash/bin/logstash agent -f /opt/logstash.conf
