from ubuntu:16.04

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y curl git calibre ttf-dejavu unzip

RUN \
  curl -o pandoc.deb -L https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-1-amd64.deb

RUN \
  dpkg -i pandoc.deb || true

RUN apt-get install -y -f

RUN \
  curl -o ipafont.zip https://oscdl.ipa.go.jp/IPAexfont/IPAexfont00301.zip && \
  unzip -j ipafont.zip -d ~/.fonts && \
  rm ipafont.zip && \
  fc-cache -fv

  CMD ["bash"]

