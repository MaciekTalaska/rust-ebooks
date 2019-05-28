from ubuntu:16.04

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y curl git calibre ttf-dejavu pandoc unzip

RUN \
  curl -o ipafont.zip https://oscdl.ipa.go.jp/IPAexfont/IPAexfont00301.zip && \
  unzip -j ipafont.zip -d ~/.fonts && \
  rm ipafont.zip && \
  fc-cache -fv

  CMD ["bash"]

