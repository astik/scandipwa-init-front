# ScandiPWA custom theme

This idea is to ease development environment setup:

- you should not need hardcoded custom host (still do not use localhost)
- you should not need to setup a proxy for forward GraphQL request to remote server

## Composer

As ScandiPWA v3 relies on _Composer_, you 'll to install it.
Either you install it on your host (no idea on how to do it as i'm no php developer), or you can use _Docker_.

```sh
alias composer='docker run --rm --interactive --tty --volume $PWD:/app composer'
composer
```

Still, for now, let's suppose that we don't have any composer dependency

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

## Start project

We need to initialize project node dependencies:

```sh
cd app/design/frontend/Scandiweb/pwa
npm install
```

Then we start the project:

```sh
npm run watch -- \
    --env.BUILD_MODE=development \
    --env.PROXY_LOGLEVEL=debug \
    --env.PROXY_TARGET=https://demo.scandipwa.com \
    --env.HOST=my-domain.local \
    --env.PORT=4242
# application is available on http://my-domain.local:4242
# remote server is https://demo.scandipwa.com
```
