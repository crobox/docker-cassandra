FROM cassandra:3.0.9

RUN mkdir /prometheus
ADD "https://bitbucket.org/sagent/downloads/downloads/jmx_prometheus_javaagent-0.6.jar" /prometheus
RUN chmod 644 /prometheus/jmx_prometheus_javaagent-0.6.jar
ADD cassandra.yml /prometheus/cassandra.yml

# add dependencies for logstash-logback-encoder
ADD lib /usr/share/cassandra/lib

ENV JVM_OPTS "$JVM_OPTS -javaagent:/prometheus/jmx_prometheus_javaagent-0.6.jar=61621:/prometheus/cassandra.yml "

EXPOSE 61621
