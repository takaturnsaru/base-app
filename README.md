
# アプリ名


## 制作背景

今回のアプリケーションは、営業職の方をターゲットにして制作しました。顧客の管理や製品情報、メール機能、社内でのやり取りツールなど、数々の機能があるのにもかかわらず、１つ１つ開いて使っているという営業の方がいて、１つの画面からいろいろなツールに遷移できるものがあったらいいなという声を聞いたので制作することにしました。営業職の方達といっても年齢やパソコンの経験がバラバラだと思うので、パソコンが全然使えない方でも簡単に使用できることを意識して作りました。

## DEMO
![Uploading ezgif.com-gif-maker.gif…]()


## 使用技術

### バックエンド

Ruby,Ruby on Rails

### フロントエンド

HTML,JavaScript,Ajax

### データベース

MySQL,Sequel Pro

### ソース管理

GitHub,GitHubDesktop

### テスト

Rspec

### エディタ

VSCode

## 課題

今回、要件定義の考え方がとても甘かったということと、開発の段取りが悪かったと感じました。要件定義の考え方が甘かった点では、開発していく上で、必要な機能や機能に対してテーブルが足りなかったりと、要件定義の大事さを実感し、今後はもっと考えた上で要件定義を考えていきたいと思いました。開発の段取りの件では、一つの機能をやり終わったと思ったが、まだやることがあることに気づき実装がバラバラになってしまいよくなかったと思います。このようなことになったのは、やることをしっかりまとめていなかったと思います。なので今後は、やることをしっかりまとめた上で実装していきたいと思います。

## 今後実装したいこと

今回のアプリでは、幅広い年代の営業職の方に使いやすくと、とてもシンプルな見た目にしていたので、次はもっと見た目を意識した作りにしていきたいと思いました。



## ペルソナ

- 性別 男性
- 年齢 20~50代
- 職業 営業職

---

## 要件定義

### ユーザー管理機能
- ユーザーを新しく登録できる
- 登録完了している場合、ログインすることができる
- 登録したユーザーのみ、ほかの機能が使えるページに遷移できる
- ログアウトできる


### 出勤退勤の打刻機能
- 出勤、退勤の打刻ができる
- 時間は日本時間

### スケジュール管理機能
- 当月のカレンダーが表示されている
- カレンダーに予定を書き込める
- メモや、やることを登録できるスペースがある

### 顧客管理機能
- 顧客一覧が見れる
- 顧客の名前をクリックすると顧客情報と購入履歴が見れる
- 購入履歴登録ボタンがある

### 購入履歴機能
- 購入履歴が顧客詳細ページで見れる
- 購入履歴を登録することができる
- 購入履歴を編集するボタンがある

### 製品管理機能
- 製品の一覧が見れる

### gmail遷移機能
- gmailページに遷移できるボタンがある

### slack遷移機能
- slackページに遷移できるボタンがある

---

# DB設計


## Usersテーブル

|column    |type       |options          |
|----------|-----------|-----------------|
|name      |string     |nill:false       |
|email     |string     |nill:false       |
|password  |string     |nill:false       |

## Association
-has_many :work_times
-has_many :schedules



## Work_timesテーブル

|column            |type       |options                      |
|------------------|-----------|-----------------------------|
|time              |datetime   |nill:false                   |
|user              |references |nill:false, foregin_key:true |

## Association
-belongs_to :user



## Schedulesテーブル

|column           |type        |options                      |
|-----------------|------------|-----------------------------|
|text             |text        |null:false                   |
|user             |references  |nill:false,foregin_key:true  |

## Associatopn
-belongs_to :user
-has_many :meetings



## meetingsテーブル

|column           |type        |options                      |
|-----------------|------------|-----------------------------|
|name             |string      |null:false                   |
|start_time       |datetime    |default:""                   |
|schedule         |references  |nill:false,foregin_key:true  |

## Association
-belongs_to :schedule



## Clientsテーブル

|column           |type        |options                      |
|-----------------|------------|-----------------------------|
|name             |string      |nill:false                   |
|postal_code      |string      |nill:false                   |
|prefectures_id   |ineger      |nill:false                   |
|city             |string      |nill:false                   |
|address          |string      |nill:false                   |
|bilding_name     |string      |default:""                   |
|phone_number     |string      |nill:false                   |

## Association
-has_many :purchasers



## productsテーブル

|column           |type        |options                       |
|-----------------|------------|------------------------------|
|name             |string      |nill:false                    |
|grade_id         |string      |nill:false                    |
|price            |integer     |nill:false                    |



## purchasersテーブル

|column                   |type        |options                       |
|-------------------------|------------|------------------------------|
|buyday                   |date        |nill:false                    |
|product_specification_id |integer     |default:""                    |
|unit_price               |integer     |default:""                    |
|quanity                  |integer     |default:""                    |
|amount                   |integer     |default:""                    |
|client                   |references  |nill:false,foregin_key:true   |

## Association
-belongs_to :client


