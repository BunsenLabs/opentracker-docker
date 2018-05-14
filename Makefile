CONTAINER_NAME ?= opentracker
IMAGE_NAME ?= $(CONTAINER_NAME)

build:
	docker build --rm . -t $(IMAGE_NAME):latest

build-pristine: | pull build

start:
	docker run -dit --network host --restart unless-stopped --name $(CONTAINER_NAME) $(IMAGE_NAME):latest

stop:
	docker stop $(CONTAINER_NAME)

remove: | stop
	docker rm $(CONTAINER_NAME)

replace: | remove start

pull:
	git fetch origin
	git reset --hard origin/master

.PHONY: build build-pristine start stop remove replace pull
