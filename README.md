
# アプリ名
営業ツール取りまとめアプリ

## 制作背景

このアプリケーションは、営業職の方をターゲットにして制作しました。
顧客管理や製品情報、メール機能、社内でのやり取りツールなど、営業の業務を行うにあたり数多くのツールを別々で使うため、手間と時間がかかるという知り合いの話がきっかけになりました。
そのため、1つの画面からそれぞれのツールに遷移できるものがあったら便利だという声を聞き、作成することにしました。営業職の方達と一言でいっても、年齢やパソコンスキルが人それぞれでバラバラだと思うので、パソコンが全然使えない方でも簡単に使用できることを意識して作成しました。

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

要件定義の考え方と開発の段取りが課題だと感じました。
【要件定義の考え方】
開発途中で、必要な機能やそれに対するテーブルが足りなかったことに気がつくことがあり、要件定義の重要性を実感しました。今後は、アプリケーションの全体像をもとに、それぞれの機能が何を行うのかを明確にした上で、そのために必要なテーブルとテーブル同士の関係性を明確にした上で、要件定義を考えていきたいと思いました。
【開発の段取り】
1つの機能が完成したと思っていたところ、まだ実装が未完了だったことにが判明し、やり直す作業が発生しました。1つの機能ひとつひとつに対して、具体的にどんな作業がどんな順番で存在するのかを明確にまとめられていなかったと反省しました。今後は、実装が前後して作業がバラバラにならないように、作業の順序の詳細を完成させた上で、実装に取り掛かっていこうと思います。

## 今後実装したいこと

現在、必要な機能面は実装できていますが、とてもシンプルな見た目になっているため、今後はもっとページの見た目を意識しアップデートしていきたいと考えています。



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


