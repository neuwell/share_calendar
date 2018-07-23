FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git vim wget

# ruby
RUN apt-get install -y rbenv ruby-build ruby-dev
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

RUN rbenv install -l
RUN rbenv install 2.5.1

RUN rbenv init -
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN rbenv global 2.5.1

RUN rbenv exec gem install bundler
RUN rbenv exec gem install rails
RUN rbenv rehash

RUN apt-get install -y nodejs npm
RUN npm cache clean
RUN npm install n -g
RUN n stable
RUN ln -sf /usr/local/bin/node /usr/bin/node
RUN apt-get purge -y nodejs
RUN npm i -g npm@4.6.1

RUN npm install -g @vue/cli
RUN npm install -g @vue/cli-init

RUN apt-get install -y tzdata libmysqlclient-dev jq
