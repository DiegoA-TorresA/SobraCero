#!/bin/sh
set -e

if [ -n "$DB_URL" ]; then
  case "$DB_URL" in
    jdbc:*)
      CLEAN_DB_URL="$DB_URL"
      ;;
    postgres://*|postgresql://*)
      rest="${DB_URL#*://}"
      case "$rest" in
        *@*) host_db="${rest#*@}" ;;
        *) host_db="$rest" ;;
      esac
      case "$host_db" in
        *:*/*) CLEAN_DB_URL="jdbc:postgresql://$host_db" ;;
        */*)
          host="${host_db%%/*}"
          db="${host_db#*/}"
          CLEAN_DB_URL="jdbc:postgresql://$host:5432/$db"
          ;;
        *) CLEAN_DB_URL="jdbc:postgresql://$host_db" ;;
      esac
      ;;
    *)
      CLEAN_DB_URL="jdbc:postgresql://$DB_URL"
      ;;
  esac
  export DB_URL="$CLEAN_DB_URL"
fi

exec java -Dspring.profiles.active=prod -Dserver.port="${PORT:-8080}" -jar app.jar
