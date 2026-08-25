#!/usr/bin/env bash
# Reset to origin/main and apply. Fetches over https because the box's SSH-alias remote fails from
# a timer. compose --build rebuilds/recreates the changed front or back; nginx config is a volume
# mount, so reload it explicitly.
set -euo pipefail
cd "$(dirname "$0")/.."

before=$(git rev-parse HEAD)
git fetch -q https://github.com/taanielj/abja_kino.git main
git reset -q --hard FETCH_HEAD
git submodule update -q --init --recursive
after=$(git rev-parse HEAD)

if [[ "$before" == "$after" ]] && [ -n "$(docker compose ps --status running -q)" ]; then
  exit 0
fi

echo "deploying $before -> $after"
docker compose up -d --build --remove-orphans
if docker exec nginx-reverse-proxy nginx -t; then
  docker exec nginx-reverse-proxy nginx -s reload
fi
echo "deployed $after"
