## usersテーブル

| Column             | Type    | Options       |
| ------------------ | ------- | ------------- |
| nickname           | string  | null: false   | 
| mail               | string  | unique: true  | 
| encrypted_password | string  | null: false   | 
| confirm_password   | string  | null: false   | 
| realname           | string  | null: false   | 
| kana               | string  | null: false   | 
| date_of_birth      | date    | null: false   | 

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | --------------------------------|
| item_name          | string      | null: false                     |
| description        | text        | null: false                     |
| category_id        | integer     | null: false                     |
| condition_id       | integer     | null: false                     |
| delivery_charge_id | integer     | null: false                     |
| prefecture_id      | integer     | null: false                     |
| ship_date_id       | integer     | null: false                     |
| price              | integer     | null: false                     |
| user               | references  | null: false, foreign_key: true  |

### Association
- belongs_to :purchase
- belongs_to :user

## addressesテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| post_code          | string      | null: false                     |
| prefecture         | string      | null: false                     |
| municipality       | string      | null: false                     |
| house_number       | string      | null: false                     |
| house_name         | string      |                                 |
| phone_number       | string      | null: false                     |
| purchase           | references  | null: false, foreign_key: true  |

### Association
- belongs_to :purchase

## purchasesテーブル

| Column      | Type        | Options                         |
| ----------- | ----------- | ------------------------------- |
| user        | references  | null: false, foreign_key: true  |
| item        | references  | null: false, foreign_key: true  |

### Association
- has_one :address
- belongs_to :item
- belongs_to :user