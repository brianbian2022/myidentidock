#!/bin/bash
set -e 
if [ "$ENV" = "DEV" ]; then
	echo "Running DEV Server"
	exec python "identidock.py"

elif [ "$ENV" = 'UNIT' ]; then
	#statements
	echo "Running Unit Tests"
	exec python tests.py
else
	echo "Running PROD Server"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
		--callable app --stats 0.0.0.0:9191
fi
