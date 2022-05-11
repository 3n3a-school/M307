#!/bin/sh

MIX_ENV=test mix deps.get
MIX_ENV=test mix ecto.reset
echo "===STARTING PHX SERVER==="
echo "===IF STARTING CYPRESS FAILS==="
echo "===RUN npm install cypress --save-dev ==="
echo "===IN THE assets/ FOLDER==="
MIX_ENV=test mix phx.server &
pid=$! # Store server pid
./assets/node_modules/.bin/cypress run
result=$?
kill -9 $pid # kill server
echo "===KILLING PHX SERVER==="
exit $result
