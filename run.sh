#!/bin/bash
ES_HOSTS=${ES_HOSTS:-127.0.0.1:9200}
ES_HOSTS=[\"${ES_HOSTS//,/\",\"}\"]
WORKERS=${WORKERS:-8}
PIPELINE_BATCH_SIZE=${PIPELINE_BATCH_SIZE:-125}
export LS_HEAP_SIZE=${LS_HEAP_SIZE:-24g}

sed -e "s/%ES_HOSTS%/$ES_HOSTS/g" \
    -e "s/%WORKERS%/$WORKERS/g" \
    /opt/logstash.conf.template > /opt/logstash.conf

/opt/logstash/bin/logstash agent -w $WORKERS -b $PIPELINE_BATCH_SIZE -f /opt/logstash.conf
