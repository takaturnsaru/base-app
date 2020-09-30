# README

## Usersテーブル

|column    |type       |options          |
|----------|-----------|-----------------|
|name      |string     |nill:false       |
|email     |string     |nill:false       |


## Association
-has_many :work_times
-has_many :schedule
-has_many :objective
-has_many :clients
-hsz_many :actions

## Work_timesテーブル

|column            |type       |options                      |
|------------------|-----------|-----------------------------|
|attendance_time   |datetime   |nill:false                   |
|leave_time        |datetime   |nill:false                   |
|over_time         |datetime   |nill:false                   |
|user              |references |nill:false, foregin_key:true |

## Association
-belongs_to :user


## Schedulesテーブル

|column           |type        |options                      |
|-----------------|------------|-----------------------------|
|date             |datetime    |default:""                   |
|plan             |text        |default:""                   |
|user             |references  |nill:false,foregin_key:true  |

## Assocoatopn
-belongs_to :user

## Clientsテーブル
|column           |type        |options                      |
|-----------------|------------|-----------------------------|
|client_name      |string      |nill:false                   |
|birthday         |date        |nill:false                   |
|postal_code      |string      |nill:false                   |
|prefectures      |ineger      |nill:false                   |
|address          |string      |nill:false                   |
|bilding_name     |string      |default:""                   |
|gender           |integer     |nill:false                   |
|profession       |integer     |nill:false                   |
|user             |references  |nill:false,foregin_key:true  |

## Association
-has_many :products
-has_many :purchase
-belongs_to :user

## productsテーブル
|column           |type        |options                       |
|-----------------|------------|------------------------------|
|product_name     |string      |nill:false                    |
|grade            |string      |nill:false                    |
|product_price    |integer     |nill:false                    |
|grade_price      |integer     |nill:false                    |
|client           |references  |nill:false,foregin_key:true   |

## Association
-has_many :purchase
-belongs_to :client

## purchaseテーブル

|column           |type        |options                       |
|-----------------|------------|------------------------------|
|client           |references  |nill:false,foregin_key:true   |
|product          |references  |nill:false,foregin_key:true   |

## Association
-belongs_to :client
-belongs_to :product


|column           |type        |options                       |
|-----------------|------------|------------------------------|
|action           |text        |default:""                    |
|user             |references  |nill:false,foregin_key:true   |

## Association
-belongs_to :user

