# Logstash

Logstash 1.4.2

configured to accept gelf input and output to elasticsearch
It is configured with :
* input: gelf, log4j
* output: elasticsearch

port 9200 must be exported using -p so browsers can access it

be careful, since port 12201 is using udp, you cannot use the svendowideit/ambassador image in front.

* `docker build -t logstash .`
* `docker run logstash`

Ports

* 12201/udp (gelf udp input)
* 9200 (embedded elasticsearch - data)
* 9300 (embedded elasticsearch - control - for node discovery)
* 9292 (kibana)
* 9500 (log4j server)
