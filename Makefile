.PHONY: run build repl test echo
PWD = $(shell pwd)
VERSION = 0.8.2
USER = $(shell whoami)
ifndef CHAPTER
  CHAPTER = "chapter02"
endif

echo:
	echo $(CHAPTER)

build:
	docker build --build-arg user=$(USER) \
	  -t sleepyfox/purescript:$(VERSION) .

run:
	docker run -it \
	-v $(PWD):/home/purescript \
	-w /home/purescript/$(CHAPTER) \
	sleepyfox/purescript:$(VERSION) bash

repl:
	docker run -it --rm \
	-v $(PWD):/home/purescript \
	-w /home/purescript/$(CHAPTER) \
	sleepyfox/purescript:$(VERSION) pulp psci

test:
	docker run -it --rm \
	-v $(PWD):/home/purescript \
	-w /home/purescript/$(CHAPTER) \
	sleepyfox/purescript:$(VERSION) pulp test
