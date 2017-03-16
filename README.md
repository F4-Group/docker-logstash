# Logstash

Logstash 2.4.1

configured to accept gelf input and output to elasticsearch
It is configured with :
* input: gelf, log4j
* filter: geoip
* output: elasticsearch

It uses a custom `gelf` input plugin and a custom `geoip` filter plugin

be careful, since port 12201 is using udp, you cannot use the svendowideit/ambassador image in front.

* `docker build -t logstash .`
* `docker run logstash` or with an external elasticsearch
* `docker run -e ES_HOSTS=1.2.3.4:9200  logstash`

Ports

* 12201/udp (gelf udp input)
* 9500/tcp (log4j server)
* 514/tcp and 514/udp (syslog)
