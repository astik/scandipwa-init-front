# ScandiPWA custom theme

This idea is to ease development environment setup:

- you won't need for hardcoded custom host (still do not use localhost)
- you'll need a proxy for sending request to remote Magento instance (media and GraphQL)

## Init project

This task is only required when creating a new project.

```sh
./init.sh my-namespace my-custom-theme-name
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
sudo REMOTE_SERVER_DOMAIN=scandipwapmrev.indvp.com node index.js
```

For the REMOTE_SERVER_DOMAIN environment variable, you can set whatever domain you want as long as there is a Magento isntance behind it.
Leave it running in the background / another terminal, it will log requests to the GraphQL endpoint.

## Start project

We need to initialize project node dependencies:

```sh
cd app/design/frontend/my-namespace/my-theme
npm install
```

Then we start the project:

```sh
npm run watch
```

It should be up and running on http://MY_LOCAL_DOMAIN
