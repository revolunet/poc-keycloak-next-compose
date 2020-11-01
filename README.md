# test-keycloak

docker-compose sample setup for [keycloak](https://github.com/keycloak/keycloak) with PG persistance and a Next.js frontend.

based on [react-keycloak](https://github.com/react-keycloak/react-keycloak)

## Setup

start a shell with `docker-compose up` and another one with `yard dev`

The web app start on http://127.0.0.1:3000 and the keycloak admin UI on http://127.0.0.1:8889

Keycloak default admin account is `admin/admin`

Load an initial realm and client from `./realm-export.json` with `./restore-realm.sh`
