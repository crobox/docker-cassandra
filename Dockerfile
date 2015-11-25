FROM cassandra:2.1.11

RUN apt-get update \
	&& apt-get -y install curl sysstat netcat

RUN curl -L http://downloads.datastax.com/community/datastax-agent-5.2.2.tar.gz | tar xz
RUN ln -s /datastax-agent-5.2.2 /datastax-agent

RUN mv /docker-entrypoint.sh /cassandra-entrypoint.sh

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD agent-entrypoint.sh /agent-entrypoint.sh
ADD log4j.opscenter.properties /datastax-agent/conf/log4j.properties

EXPOSE 61621