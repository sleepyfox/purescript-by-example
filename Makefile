.PHONY: run build repl
PWD = $(shell pwd)
VERSION = 0.8.2

build:
	docker build -t sleepyfox/purescript:$(VERSION) .

run:
	docker run -it \
	-v $(PWD):/home/purescript \
	sleepyfox/purescript:$(VERSION) bash

repl:
	docker run -it --rm \
	-v $(PWD):/home/purescript \
	sleepyfox/purescript:$(VERSION) psci
