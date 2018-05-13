CONTAINER_NAME ?= opentracker
IMAGE_NAME ?= $(CONTAINER_NAME)


build:
	docker build --rm . -t $(IMAGE_NAME):latest

build-pristine: pull build

start:
	docker run -dit --network host --restart unless-stopped --name $(CONTAINER_NAME) $(IMAGE_NAME):latest

replace: build
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
	docker run -dit --network host --restart unless-stopped --name $(CONTAINER_NAME) $(IMAGE_NAME):latest

pull:
	git fetch origin
	git reset --hard origin/master

.PHONY: build start replace
