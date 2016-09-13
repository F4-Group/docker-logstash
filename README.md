# Logstash

Logstash 2.4.0

configured to accept gelf input and output to elasticsearch
It is configured with :
* input: gelf, log4j
* output: elasticsearch

be careful, since port 12201 is using udp, you cannot use the svendowideit/ambassador image in front.

* `docker build -t logstash .`
* `docker run logstash` or with an external elasticsearch
* `docker run -e ES_HOSTS=1.2.3.4:9200  logstash`

Ports

* 12201/udp (gelf udp input)
* 9500 (log4j server)
