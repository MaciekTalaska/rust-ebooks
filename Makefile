MAKEFILE_DIR=$(shell pwd)
LOCAL_DIST_DIR=$(MAKEFILE_DIR)/dist
DIST_DIR=/trpl-ebook/dist

build:
	docker build -t trpl-ebook -f Dockerfile .

trplmobi: build
	docker cp $(shell docker ps -alq):/trpl-book/src/trpl-book.mobi .

trplepub: build
	docker cp $(shell docker ps -alq):/trpl-book/src/trpl-book.epub .

trpl:	build trplmobi trplepub
	echo "done!"
