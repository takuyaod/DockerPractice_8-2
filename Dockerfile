# ベースにするイメージを指定
FROM ruby:2.5.7

# RailsのインストールやMySQLへの接続に必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim

# コンテナ内にmyappディレクトリを作成
RUN mkdir /app

# 作成したmyappディレクトリを作業用ディレクトリとして設定
WORKDIR /app

# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# コンテナ内にコピーした Gemfile の bundle install
RUN bundle install

# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー
COPY . /app