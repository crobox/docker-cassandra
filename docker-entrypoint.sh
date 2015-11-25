#!/bin/bash
set -e

/agent-entrypoint.sh &

exec /cassandra-entrypoint.sh "$@"