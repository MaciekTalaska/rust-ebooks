build:
	docker build -t trpl-ebook -f Dockerfile .

mobi: build epub 
	docker run -dt trpl-ebook
	docker cp trpl-book.epub `docker ps -alq`:/trpl-book.epub
	docker exec `docker ps -alq` sh -c "ebook-convert /trpl-book.epub /trpl-book.mobi"
	docker cp `docker ps -alq`:/trpl-book.mobi .
	docker stop `docker ps -alq`

epub: build 
	docker run -dt trpl-ebook 
	docker cp ./build_epub.sh  `docker ps -alq`:/ 
	docker cp ./trpl-title.txt `docker ps -alq`:/ 
	docker exec `docker ps -alq` sh -c "./build_epub.sh"
	docker cp `docker ps -alq`:/trpl-book/src/trpl-book.epub .
	docker stop `docker ps -alq`

