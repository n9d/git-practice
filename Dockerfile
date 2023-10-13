FROM ubuntu

RUN rm -rf /var/lib/apt/lists/*
#RUN sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y -qq install vim
RUN apt-get -y install git curl

# zsh
RUN apt-get install -y git zsh
RUN chsh -s /bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
RUN sed -i -E 's/^ZSH_THEME.+$/ZSH_THEME="jonathan"/; s/^plugins=.*$/plugins=(git zsh-autocomplete)/' ~/.zshrc

# japanese
RUN apt-get install -y language-pack-ja manpages-ja
RUN locale-gen ja_JP.UTF-8
ENV LANG "ja_JP.UTF-8"

COPY dot.gitconfig /root/.gitconfig

