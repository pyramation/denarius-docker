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

### importing your paper wallet (or from private key)

```sh
./denariusd importprivkey <yourSuperPrivateKey> <label>
```

## Trouble Shooting

If you are not sure if something is working, maybe you haven't fully sync'd with the network. A tip is to look at your data dir and also you can tail the log to see if it's pulling down the blockchain:

You can check the size of the `blk0001.dat` and the `txleveldb` as they grow:

```
root at 955f6129828c in /denarius/src on master*
$ du -sh ~/.denarius/*
6.7M	/root/.denarius/blk0001.dat
10M	/root/.denarius/database
0	/root/.denarius/db.log
3.9M	/root/.denarius/debug.log
4.0K	/root/.denarius/denarius.conf
60K	/root/.denarius/peers.dat
4.0K	/root/.denarius/smsg.ini
400K	/root/.denarius/smsgDB
8.3M	/root/.denarius/txleveldb
68K	/root/.denarius/wallet.dat
```

Also `tail -f debug.log` will show you that it's downloading the blockchain:

```
received block 0000000006b0f74936f7
SetBestChain: new best=0000000006b0f74936f7  height=24753  trust=3701284023190831  blocktrust=130970706072  date=06/28/17 06:42:16
ProcessBlock: ACCEPTED
received block 00000000047778b35e39
SetBestChain: new best=00000000047778b35e39  height=24754  trust=3701519770547460  blocktrust=235747356629  date=06/28/17 06:43:20
ProcessBlock: ACCEPTED
received block 0000000005cbcd418b1d
```
