# README

# テーブル設計

## users テーブル

| Column                | Type   | Options                      |
| --------              | ------ | -----------                  |
| nickname              | string | null: false                  |
| email                 | string | null: false,unique: true     |
| encrypted_password    | string | null: false                  |
| name                  | string | null: false                  |
| family_name           | string | null: false                  |



### Association

- has_many :comments, dependent: :destroy


## groups テーブル

| Column                | Type   | Options                      |
| --------              | ------ | -----------                  |
| group_name            | string | null: false                  |
| email                 | string | null: false,unique: true     |
| encrypted_password    | string | null: false                  |
| chair_person          | string | null: false                  |



### Association

- has_many :performances, dependent: :destroy




## performance テーブル

| Column            | Type        | Options                            |
| --------          | ------      | -----------                        |
| title             | string      | null: false                        |
| explain           | text        | null: false                        |
| staff_name        | text        | null: false                        |
| theater           | string      | null: false                        |
| start_day         | date        | null: false                        |
| finish_day        | date        | null: false                        |
| groups            | references  | null: false, foreign_key: true     |


### Association

- has_many :comments 
- belongs_to :group


## comments テーブル

| Column         | Type        | Options         |
| --------       | ------      | ---------       |
| text           | text        | null: false     |
| performance    | references  |                 |
| user           | references  |                 |

### Association

- belongs_to :user
- belongs_to :performance



//## orders テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

//### Association

- has_one :address
- belongs_to :user
- belongs_to :item

//## addresses テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| postal_num  | string     | null: false                    |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone_num   | string     | null: false                    |
| order       | references | null: false, foreign_key: true |

### Association

- belongs_to :order



