build:
	git fetch origin
	git reset --hard origin/master
	docker build --rm . -t opentracker:latest

start:
	docker run -dit --network host --restart unless-stopped --name tracker opentracker:latest

.PHONY: build start
