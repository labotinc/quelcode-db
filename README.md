# 物理設計とDDL文の作成

- [要件定義]()を元にDB定義書とDDL文を作成

## ディレクトリ解説

```
quelcode-php
├── db ....................... 作成したSQL文の格納場所
├── mysql5.7
│   ├── mysql .................. 起動すると作られる。データ永続化用
│   ├── mysqlvolume ............ mysqlコンテナにマウントされる。ホストとのファイル受け渡し用
│   └── my.cnf ................. mysqlコンテナの設定ファイル
│  
├── .gitignore
├── docker-compose.yml
└── README.md
```

## データベース情報
MySQLバージョン 5.7.x

## phpMyAdmin接続方法

Dockerを立ち上げた後以下のアドレスにアクセスする

http://localhost:10081
