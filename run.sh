#!/bin/bash
ES_HOST=${ES_HOST:-127.0.0.1}
ES_HTTP_PORT=${ES_HTTP_PORT:-9200}
export LS_HEAP_SIZE=${LS_HEAP_SIZE:-24g}

sed "s/%ES_CONF%/\n    embedded => false\n    host => [\"$ES_HOST\"]\n    port => $ES_HTTP_PORT\n    protocol => \"http\"\n/g" /opt/logstash.conf.template > /opt/logstash.conf

/opt/logstash/bin/logstash agent -f /opt/logstash.conf
