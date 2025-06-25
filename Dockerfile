FROM nginx:latest
# htmlをコンテナ内にコピー
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./portforio.html /usr/share/nginx/html/
# 画像、ファイルを格納するディレクトリを作成
RUN mkdir /usr/share/nginx/html/JS
RUN mkdir /usr/share/nginx/html/img
RUN mkdir /usr/share/nginx/html/data
RUN mkdir /usr/share/nginx/html/data/CSS
# 作成したディレクトリに画像とファイルをコピー(格納)
COPY ./JS/ /usr/share/nginx/html/JS/
COPY ./img/ /usr/share/nginx/html/img/
COPY ./data/ /usr/share/nginx/html/data/
COPY ./CSS/ /usr/share/nginx/html/CSS/
