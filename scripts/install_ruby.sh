#!/bin/bash

echo "-- Installing rbenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

echo "-- Installing ruby-build"
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

echo "-- installing ruby"
~/.rbenv/bin/rbenv install 2.3.1

echo "-- setting global ruby"
~/.rbenv/bin/rbenv global 2.3.1

echo "-- installing bundler"
~/.rbenv/shims/gem install bundler
