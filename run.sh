#!/bin/bash
ES_HOST=${ES_HOST:-127.0.0.1}
ES_HTTP_PORT=${ES_HTTP_PORT:-9200}
ES_PORT=${ES_PORT:-9300}
LS_HEAP_SIZE=${LS_HEAP_SIZE:-24g}
ES_EMBEDDED=${ES_EMBEDDED:-true}

if [ "$ES_EMBEDDED" = "true" ]; then
    sed "s/%ES_CONF%/embedded => true/g" /opt/logstash.conf.template > /opt/logstash.conf
else
    sed "s/%ES_CONF%/embedded => false host => "$ES_HOST" port => $ES_PORT/g" /opt/logstash.conf.template > /opt/logstash.conf
fi

# configure elasticsearch in kibana
sed -i "s/\s.elasticsearch:.*/     elasticsearch: \"http:\/\/$ES_HOST:$ES_HTTP_PORT\",/g" /opt/logstash/vendor/kibana/config.js
/opt/logstash/bin/logstash agent -f /opt/logstash.conf -- web
