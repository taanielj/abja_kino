#!/usr/bin/env bash
# Keep the demo's screenings upcoming: whenever the earliest seance has slipped into the past,
# shift the whole schedule forward by whole weeks (preserving weekday and time). No-op otherwise.
set -euo pipefail
cd "$(dirname "$0")/.."
U=$(grep -oP '(?<=^POSTGRES_USER=).*' .env)
D=$(grep -oP '(?<=^POSTGRES_DATABASE=).*' .env)

docker exec -i abja-postgres psql -U "$U" -d "$D" -v ON_ERROR_STOP=1 <<'SQL'
UPDATE seance
SET start_time = start_time + make_interval(weeks => w.n)
FROM (SELECT ceil(extract(epoch FROM now() - min(start_time)) / 604800)::int AS n FROM seance) w
WHERE w.n > 0;
SQL
