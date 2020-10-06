# README

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


