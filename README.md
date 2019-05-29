This is a solution for building .epub and .mobi from sources of 'The Rust Programming Language'

This is inspired by https://github.com/abcdev/trpl-ebook/blob/restructure/, but instead of using [trpl-ebook](https://github.com/killercup/trpl-ebook), I decided to use tools such as:
- pandoc (generating epub from makrdown)
- calibre (converting epub to mobi)

I just needed the ebook generated from the very latest sources of the book. I could do it manually, but I decided to automate the task a bit.

### Usage

Targets in `Makefile` should be self-explanatory, but just for the sake of completeness of this doc:

- `build` is responsible for downloading Ubuntu image, installing pandoc, calibre, git, additional fonts - everything that is needed for the creation of epub and converting it later to mobi.

- `epub` depends on `build` and as a result should crate `trpl-book.epub` file in the directory where the `Makefile` is located

- `mobi` depends on `epub` and takes the generated .epub file and converts it to a mobi file

### Known limiations/problems

1. Due to the way Pandoc works links between chapters are not working. 
2. The original table of content does not work (pandoc is capable of generating automatic ToC - use `--toc` option to achieve that) 
3. Some tables are not looking as nice as in HTML version of the book 
4. It seems that listings (some? all? I haven't checked) are missing 'ferris icons' ;(

I will try to fix the issues listed above, but this is not top priority for me - I wanted to be able to read the latest TRPL on ebook reader and I am pretty happy with what I have achieved.

### Alternatives

For other Rust books you should definitely check:
* [ebookmaker](https://github.com/setanta/ebookmaker/)
* [trpl-ebook](https://github.com/killercup/trpl-ebook) (check forks of the project as well)
* [mdbookshelf](https://github.com/rams3s/mdbookshelf) (this project is based on `mdbook-epub`, which has the following problems:
  - graphics/images are not all embedded into the final epub
  - tables are not converted correctly
  - only .epub files are produced, so conversion to mobi (if needed) is something you have to deal with yourself
  - there is no code syntax highlights)

### How to generate other books (easily) using `rust-ebooks`?

Examine the content of the `build_epub.sh` file. Most probably slight changes will make this code work for other books. For books that follow the structure of TRPL the only changes needed are:
1) point to another repository
2) provide proper list of markdown files to pandoc

In case you have to create ebook from a book written in HTML - this should also be similar, but please bear in mind that HTML version of books often have menus etc, sidebar navigation etc. - which you probably want to get rid if first when preparing your ebook. 
