MAKEFILE_DIR=$(shell pwd)
LOCAL_DIST_DIR=$(MAKEFILE_DIR)/dist
DIST_DIR=/trpl-ebook/dist

build:
	docker build -t trpl-ebook -f Dockerfile .

run:
	docker run -t -d trpl-ebook 

trplmobi: build trplepub 
	docker run -dt trpl-ebook
	cid=$(docker ps -alq)
	docker exec `docker ps -alq` sh -c "mkdir /trpl-book && mkdir /trpl-book/src"
	docker cp trpl-book.epub `docker ps -alq`:/trpl-book/src/trpl-book.epub
	docker exec `docker ps -alq` sh -c "ebook-convert /trpl-book/src/trpl-book.epub /trpl-book/src/trpl-book.mobi"
	docker cp `docker ps -alq`:/trpl-book/src/trpl-book.mobi .

trplepub: build 
	set -x
	docker run -dt -v `pwd`/book:/book trpl-ebook 
	docker cp ./build_epub.sh  `docker ps -alq`:/ 
	docker exec `docker ps -alq` sh -c "./build_epub.sh"
	docker cp `docker ps -alq`:/trpl-book/src/trpl-book.epub .

trpl:	build trplepub trplmobi
	docker stop `docker ps -alq`
	echo "done!"
