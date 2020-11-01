#!/bin/sh

KEYCLOAK_URL=http://127.0.0.1:8889/auth
KEYCLOAK_REALM=master
KEYCLOAK_CLIENT_ID=admin
KEYCLOAK_CLIENT_SECRET=admin

# get admin token for master realm
TKN=$(curl -X POST "${KEYCLOAK_URL}/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token" \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=${KEYCLOAK_CLIENT_ID}" \
 -d "password=${KEYCLOAK_CLIENT_SECRET}" \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

# create the new realm
curl -H "Authorization: Bearer $TKN" -H "Content-Type: application/json" -d '@realm-export.json' $KEYCLOAK_URL/admin/realms
