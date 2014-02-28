#!/bin/bash
docker run -d -p 12201/udp -p 9200 -p 9300 -p 9292 -name logstash $1