FROM ubuntu:22.04
# RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
# RUN sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
# RUN sed -i '/stretch-updates/d' /etc/apt/sources.list
# # ミラー
# RUN sed -i.org -e 's|archive.ubuntu.com|ubuntutym.u-toyama.ac.jp|g' /etc/apt/sources.list

RUN apt-get update
#RUN apt-get upgrade
RUN apt-get install -y language-pack-ja git
# vimはワーニングがマニュアルあたりでうるさいのでブラックホール行き
RUN apt-get -y -qq install vim
RUN locale-gen ja_JP.UTF-8
ENV LANG "ja_JP.UTF-8"

COPY git-completion.sh /root/
COPY git-prompt.sh /root/
COPY dot.bashrc /root/
COPY dot.gitconfig /root/.gitconfig

RUN cat /root/.bashrc /root/dot.bashrc > /root/.bashrc
