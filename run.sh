#!/usr/bin/env bash
set -eEuo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

cd "$HERE"

export VAULT_ADDR=https://vault.dide.ic.ac.uk:8200
ELASTIC_PASSWORD="$(vault read -field=password /secret/logs/users/elastic)"
export ELASTIC_PASSWORD
docker-compose up -d
