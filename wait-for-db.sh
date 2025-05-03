#!/bin/sh
# wait-for-db.sh

set -e

host="$1"
shift
cmd="$@"

until mysqladmin ping -h "$host" --silent; do
  echo "Waiting for MySQL..."
  sleep 2
done

exec $cm

# Copia o script wait-for-db.sh para o contêiner
COPY wait-for-db.sh /app/

# Concede permissão de execução ao script
RUN chmod +x /app/wait-for-db.sh