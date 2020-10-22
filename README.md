
# アプリ名


## 制作背景

今回のアプリケーションは、営業職の方をターゲットにして制作しました。顧客の管理や製品情報、メール機能、社内でのやり取りツールなど、数々の機能があるのにもかかわらず、１つ１つ開いて使っているという営業の方がいて、１つの画面からいろいろなツールに遷移できるものがあったらいいなという声を聞いたので制作することにしました。営業職の方達といっても年齢やパソコンの経験がバラバラだと思うので、パソコンが全然使えない方でも簡単に使用できることを意識して作りました。

## DEMO

- ログイン画面
![ezgif com-gif-maker](https://user-images.githubusercontent.com/69668280/96561366-6de85a00-12fa-11eb-900f-7416eecc0f51.gif)

- スケジュール管理機能
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/69668280/96584707-9764ae00-1319-11eb-8a7f-f0fef9d3b040.gif)

- 勤怠管理機能
<img width="1220" alt="スクリーンショット 2020-10-20 21 21 38" src="https://user-images.githubusercontent.com/69668280/96586418-f4f9fa00-131b-11eb-9cd9-b3611221306b.png">

- 顧客管理機能
![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/69668280/96586246-b401e580-131b-11eb-99e2-49fd6980d16f.gif)

- 製品一覧機能
<img width="1211" alt="スクリーンショット 2020-10-20 21 33 14" src="https://user-images.githubusercontent.com/69668280/96586379-e14e9380-131b-11eb-959d-830f509699a5.png">

- 管理者ページ
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/69668280/96701481-9c823580-13cb-11eb-82e4-d0b3ace5e23c.gif)
管理者の新規作成、編集、削除できるようにしました。


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
- 管理者のみ編集、削除ができる

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
has_many :schedules
has_many :work_times
has_many :meetings
has_many :leave_times


## adminsテーブル

|column    |type     |options            |
|----------|---------|-------------------|
|name      |string   |null:false         |
|email     |string   |null:false         |
|password  |string   |null:false         |

## association

- has_many :products



## Work_timesテーブル

|column            |type       |options                      |
|------------------|-----------|-----------------------------|
|attendence        |datetime   |nill:false                   |
|user              |references |nill:false, foregin_key:true |

## Association
- belongs_to :user


## Leave_timesテーブル

|column            |type       |options                      |
|------------------|-----------|-----------------------------|
|leave             |datetime   |nill:false                   |
|user              |references |nill:false, foregin_key:true |

## Association
- belongs_to :user


## Schedulesテーブル

|column           |type        |options                      |
|-----------------|------------|-----------------------------|
|text             |text        |null:false                   |
|user             |references  |nill:false,foregin_key:true  |

## Associatopn
- belongs_to :user
- has_many :meetings



## Meetingsテーブル

|column           |type        |options                      |
|-----------------|------------|-----------------------------|
|name             |string      |null:false                   |
|start_time       |datetime    |default:""                   |
|user             |references  |nill:false,foregin_key:true  |

## Association
- belongs_to :user


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
- has_many :purchasers



## productsテーブル

|column           |type        |options                       |
|-----------------|------------|------------------------------|
|name             |string      |nill:false                    |
|grade_id         |string      |nill:false                    |
|price            |integer     |nill:false                    |
|admin            |references  |nill:false,foregin_key:true   |

## Association
- belongs_to :admin


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
- belongs_to :client


