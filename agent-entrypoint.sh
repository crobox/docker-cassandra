#!/bin/bash
set -e

echo "stomp_interface: $OPS_IP" | tee -a /datastax-agent/conf/address.yaml
echo "stomp_port: $OPS_PORT" | tee -a /datastax-agent/conf/address.yaml

echo "Waiting for cassandra to come up..."
while ! echo exit | nc -z -w 3 localhost 9042; do sleep 3; done

/datastax-agent/bin/datastax-agent -f