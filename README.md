# プロジェクト名
chat-project

# 概要
Vue.jsの勉強の為に作成した簡単なチャットアプリです。

詳しくは下記をご覧下さい。

https://qiita.com/tykt/items/5fa6140553e64dab88be

# 環境
- java17
- maven3.8.6
- vue2.6.11
- node16.13.2
- mysql

# インストール方法
**Docker Desktop**のみインストール必要です。

公式ページよりインストーラーをダウンロードし、インストールします。

https://www.docker.com/

# 実行方法

## 前提条件

- mac ※windowsでもdockerの知識がある方であれば実行できると思います。
 
- Dockerコマンドが使用できること
 
## 手順

ターミナルを使用します。

1. 適当なフォルダへ移動し、当プロジェクトをクローン

`cd [任意のフォルダ]`

`git clone https://github.com/tkNoPrivate/chat-project.git`

2. クローンしたプロジェクトへ移動

`cd chat-project`

3. イメージのビルド

`docker-compose build`

4. コンテナの作成、起動

`docker-compose up -d`

