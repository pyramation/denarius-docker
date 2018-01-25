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

It will give you a prompt to edit the `denarius.conf` in the data dir. Copy and paste the credentials it gives you. Edit `denarius-data/denarius.conf`, or if you're inside the docker container, you can edit `/root/.denarius/denarius.conf` using `vim`:

```sh
rpcuser=denariusrpc
rpcpassword=<somelongpassword>
```

### now you'll need to restart `denariusd`

```sh
./denarius
```

### now, open another shell

Leaving that other shell running, `ssh` into the existing container. You can get the container id like so

```sh
$ docker ps
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS              PORTS               NAMES
d173377e3757        pyramation/denarius   "bash"              5 minutes ago       Up 5 minutes                            dazzling_booth
```

Now jump inside with the `exec` command:

```sh
docker exec -ti d173377e3757 /bin/bash
```

### now, run `denariusd` commands

```sh
./denariusd help
```

### managing your wallet

The data directory will end up on your host machine in a folder called `denarius-data`

# helpful tips

### encrypt your wallet

```sh
$ ./denariusd encryptwallet <superstrongpassword>
```

### get your address

```sh
$ ./denariusd getaccountaddress 0
DKhWkqMvpWBEL4D9RNtLxMvKDgCh8d32uN
```

### (carefully) get your private key

```sh
./denariusd dumpprivkey DKhWkqMvpWBEL4D9RNtLxMvKDgCh8d32uN
```
