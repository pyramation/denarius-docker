# docker-based denarius wallet

This image provides `denariusd` via docker while mounting a local folder for the denarius `data-dir` to keep blockchain and wallet info on your host machine.

## usage

### build the image

```sh
make
```

### run it

```sh
make run
```

or if you want to use `docker` manually:

```sh
docker run -v `pwd`/denarius-data:/root/.denarius -w /denarius/src -i -t pyramation/denarius bash
```

### managing your wallet

The data directory will end up on your host machine in a folder called `denarius-data`
