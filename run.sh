#!/bin/bash
ES_HTTP_PORT=${ES_HTTP_PORT:-9200}
ES_HOST=${ES_HOST:-127.0.0.1}
LS_HEAP_SIZE=24g

# configure elasticsearch in kibana
sed -i "s/\s.elasticsearch:.*/     elasticsearch: \"http:\/\/$ES_HOST:$ES_HTTP_PORT\",/g" /opt/logstash/vendor/kibana/config.js
/opt/logstash/bin/logstash agent -f /opt/logstash.conf -- web
