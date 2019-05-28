This is a solution for building .epub and .mobi from sources of 'The Rust Programming Language'

This is inspired by https://github.com/abcdev/trpl-ebook/blob/restructure/, but instead of using [trpl-ebook](https://github.com/killercup/trpl-ebook), I decided to use tools such as:
- pandoc (generating epub from makrdown)
- calibre (converting epub to mobi)

I just needed the ebook generated from the very latest sources of the book. I could do it manually, but I decided to automate the task a bit.

### Usage

Depending on the destination format type:
* `make epub` - if you need only .epub file
* `make mobi` - this will generate both: epub & mobi (as epub is just first, required step to make a mobi file)

### Known limiations

1. Due to the way Pandoc works links between chapters are not working. The original table of content also doesnt work ;/
2. Some tables are not looking that well as in html version
3. It seems that listings are missing 'ferris' icons ;(

I will try to fix the issues listed above, but this project is not the top of my priority.

### Alternatives

For other Rust books you should definitely check:
* [trpl-ebook](https://github.com/killercup/trpl-ebook) (check forks of the project as well)
* [mdbookshelf](https://github.com/rams3s/mdbookshelf) (this project is based on `mdbook-epub`, which has the following problems:
- graphics/images are not all embedded into the final epub
- tables are not converted correctly
- there is no code syntax highlights)

### How to generate other books (easily) using `rust-ebooks`?

Examine the content of the `build_epub.sh` file. Most probably slight changes will make this code work for other books. For books that follow the structure of TRPL the only changes needed are:
1) point to another repository
2) provide proper list of markdown files to pandoc

In case you have to create ebook from a book written in HTML - this should also be similar, but please bear in mind that HTML version of books often have menus etc, sidebar navigation etc. - which you probably want to get rid if first when preparing your ebook. 

