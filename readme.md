# Logstash

Logstash 1.3.3

configured to accept gelf input and output to elasticsearch
port 9200 must be exported using -p so browsers can access it

* `docker build -t logstash .`
* `docker run logstash`

Ports

* 12201/udp (gelf udp input)
* 9200 (embedded elasticsearch)

