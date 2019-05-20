This is a solution for building .epub and .mobi from sources of 'The Rust Programming Language'

This is inspired by https://github.com/abcdev/trpl-ebook/blob/restructure/, but instead of using [trpl-ebook](https://github.com/killercup/trpl-ebook), I decided to use tools such as:
- pandoc
- calibre

### Usage

type in `make trpl` to get an epub version of the book build from the newest sources.

### Future

Ideally I would like to:
 - [x] generate .mobi files
 - [ ] generate other books for Rustaceans (wasm book, embedded rust...)
 - [ ] get rid of Ubuntu as the base image, and use something smaller (Alpine? NixOS?)
 
