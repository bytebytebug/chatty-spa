FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

RUN apt-get update

RUN apt-get install -y ca-certificates apt-transport-https software-properties-common
RUN apt-get install -y curl git make locales nodejs npm python3 pip cargo ripgrep neovim
RUN apt-get install -y sudo

RUN apt-get clean
RUN echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ubuntu

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim

WORKDIR /home/ubuntu/app

CMD ["npm", "run", "dev", "--", "--host"]
#CMD ["sleep", "infinity"]
