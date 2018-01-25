# docker-based denarius wallet

This image provides `denariusd` via docker while mounting a local folder for the denarius `data-dir` to keep blockchain and wallet info on your host machine.

## usage

First build the image, by running `make`, then run the container

```sh
docker run -v /denarius-data:/home/denarius/.denarius -w /home/denarius/src -i -t pyramation/denarius bash
```
