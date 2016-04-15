FROM cassandra:3.0.5

RUN apt-get update \
	&& apt-get -y install curl sysstat netcat rsync

RUN curl -L http://downloads.datastax.com/community/datastax-agent-5.2.4.tar.gz | tar xz
RUN ln -s /datastax-agent-5.2.4 /datastax-agent

RUN mv /docker-entrypoint.sh /cassandra-entrypoint.sh

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD agent-entrypoint.sh /agent-entrypoint.sh
ADD log4j.opscenter.properties /datastax-agent/conf/log4j.properties

EXPOSE 61621
