def:
	docker build -t "pyramation/denarius" .

run:
	docker run -v `pwd`/denarius-data:/root/.denarius -w /denarius/src -i -t pyramation/denarius bash

push:
	docker push "pyramation/denarius"
