This is a solution for building .epub and .mobi from sources of 'The Rust Programming Language'

This is inspired by https://github.com/abcdev/trpl-ebook/blob/restructure/, but instead of using trpl-eb ook, I decided to use well know, old & maintained for years tools such as:
- pandoc
- calibre

### Usage

type in `make trpl` to get an epub version of the book build from the newest sources.

### Future

Ideally I would like to:
 - [ ] generate .mobi files
 - [ ] generate other books for Rustaceans (wasm book, embedded rust...)
 - [ ] get rid of Ubuntu as the base image, and use something smaller (Alpine? NixOS?)
 
