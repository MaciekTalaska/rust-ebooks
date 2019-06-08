build:
	docker build -t rust-ebook -f Dockerfile .

mobi: build epub 
	docker run -dt rust-ebook
	docker cp trpl.epub `docker ps -alq`:/trpl.epub
	docker exec `docker ps -alq` sh -c "ebook-convert /trpl.epub /trpl.mobi"
	docker cp `docker ps -alq`:/trpl.mobi .
	docker stop `docker ps -alq`

epub: build 
	docker run -dt rust-ebook 
	docker cp ./build_epub.sh  `docker ps -alq`:/ 
	docker exec `docker ps -alq` sh -c "./build_epub.sh"
	docker cp `docker ps -alq`:/book/src/trpl.epub .
	docker stop `docker ps -alq`

