MAKEFILE_DIR=$(shell pwd)
LOCAL_DIST_DIR=$(MAKEFILE_DIR)/dist
DIST_DIR=/trpl-ebook/dist

build:
	docker build -t trpl-ebook -f Dockerfile .

trpl: build
	docker cp $(shell docker ps -alq):/trpl-book/src/trpl-book.epub .
