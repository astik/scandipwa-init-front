# ScandiPWA custom theme

This idea is to ease development environment setup:

- you won't need for hardcoded custom host (still do not use localhost)
- you'll need a proxy for sending request to remote Magento instance (media and GraphQL)

## Prerequisite

### Host

In order for live reload to work a new host needs to be set:

```sh
cat >> hosts << EOF
127.0.0.1 scandipwa.local
::1 scandipwa.local
EOF
```

This is mandatory as the domain `scandipwa.local` is hardcoded in _src/config/webpack.development.config.js_.

## Init project

This task is only required when creating a new project.

```sh
./init.sh
```

## Init submodules

After cloning the project, we need to initialize submodules:

```sh
git submodule init
git submodule update
```

## Proxy remote Magento

We need reverse-proxy node project:

```sh
cd reverse-proxy
npm install
REMOTE_SERVER_DOMAIN=scandipwapmrev.indvp.com LOCAL_PORT=3000 LOCAL_DOMAIN=scandipwa.local node index.js
# application is available on http://scandipwa.local:3000
```

For the REMOTE_SERVER_DOMAIN environment variable, you can set whatever domain you want as long as there is a Magento instance behind it.
Leave it running in the background / another terminal, it will log requests to the GraphQL endpoint.

## Start project

We need to initialize project node dependencies:

```sh
cd app/design/frontend/Scandiweb/pwa
npm install
```

Then we start the project:

```sh
npm run watch
# application is available on port 3003
# but to use it, you'll need to go through reverse proxy on http://scandipwa.local:3000
```
