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

### start `denariusd`

```sh
cd /denarius/src
./denariusd
```

it will give you a prompt to edit the `denarius.conf` in the data dir. Copy and paste the credentials it gives you.


### open another shell

Now, `ssh` into the existing container. You can get the container id like so

```sh
$ docker ps
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS              PORTS               NAMES
d173377e3757        pyramation/denarius   "bash"              5 minutes ago       Up 5 minutes                            dazzling_booth
```

Now jump inside with the `exec` command:

```sh
docker exec -ti d173377e3757 /bin/bash
```

### running `denariusd` commands

```sh
./denariusd help
```

### managing your wallet

The data directory will end up on your host machine in a folder called `denarius-data`
