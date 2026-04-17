#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 ]]; then
  echo "Usage: $0 <user-data-dir> <profile-directory> <cdp-port> <start-url>"
  exit 1
fi

USER_DATA_DIR="$1"
PROFILE_DIRECTORY="$2"
CDP_PORT="$3"
START_URL="$4"

CHROME_BIN="${CHROME_BIN:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"

exec "$CHROME_BIN" \
  "--remote-debugging-port=$CDP_PORT" \
  "--remote-allow-origins=*" \
  "--user-data-dir=$USER_DATA_DIR" \
  "--profile-directory=$PROFILE_DIRECTORY" \
  --no-first-run \
  --disable-default-apps \
  --new-window "$START_URL"

