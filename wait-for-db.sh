#!/bin/sh
# wait-for-db.sh

set -e

host="$1"
shift
cmd="$@"

until pg_isready -h "$host" -q; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

exec $cmd