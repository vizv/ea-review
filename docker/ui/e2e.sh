#!/bin/sh

set -e

echo 'Start mock API server...'
node tests/mock-api/api.js &
API_PID="$!"
echo 'API server started.'

echo 'Run E2E test...'
yarn test:e2e

echo 'Stop mock API server...'
kill -9 $API_PID
