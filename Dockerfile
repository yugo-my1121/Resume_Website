FROM ubuntu:latest

# nginxインストールとvim(ファイル編集用エディタ)必要パッケージ
RUN apt-get update && \
  apt-get install -y nginx vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# htmlをコンテナ内にコピー
COPY ./portforio.html /var/www/html/
COPY ./index.html /var/www/html/
# 画像、ファイルを格納するディレクトリを作成
RUN mkdir /var/www/html/JS
RUN mkdir /var/www/html/img
RUN mkdir /var/www/html/data
RUN mkdir /var/www/html/data/CSS
RUN rm /var/www/html/index.nginx-debian.html
# 作成したディレクトリに画像とファイルをコピー(格納)
COPY ./JS/ /var/www/html/JS/
COPY ./img/ /var/www/html/img/
COPY ./data/ /var/www/html/data/
COPY ./CSS/ /var/www/html/CSS/

# nginxポート開放
EXPOSE 80

# nginxをフォアグラウンドで起動（コンテナ起動時)
CMD ["nginx", "-g", "daemon off;"]
