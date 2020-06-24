# ScandiPWA custom theme - reverse-proxy

This idea is to have a full node setup for ScandiPWA fontend development.
So that, here is a simple reverse-proxy to replace Nginx setup.

To install:

```sh
npm install
```

To start:

```sh
REMOTE_SERVER_DOMAIN=scandipwapmrev.indvp.com LOCAL_PORT=3000 LOCAL_DOMAIN=scandipwa node index.js
# application is available on http://scandipwa:3000
```

For the REMOTE_SERVER_DOMAIN environment variable, you can set whatever domain you want as long as there is a Magento instance behind it.
Leave it running in the background / another terminal, it will log requests to the GraphQL endpoint.
