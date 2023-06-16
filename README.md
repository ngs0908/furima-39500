## userテーブル

| Column       | Type    | Options       |
| ------------ | ------- | ------------- |
| nickname     | string  | null: false   | 
| mail         | string  | null: false   | 
| pw           | string  | null: false   | 
| realname     | string  | null: false   | 
| kana         | string  | null: false   | 
| date_of_birth| date    | null: false   | 

### Association
- has_many :merch
- has_many :purchase


## merchテーブル

| Column         | Type    | Options      |
| -------------- | ------- | -------------|
| image          | string  | null: false  |
| merch_name     | string  | null: false  |
| description    | text    | null: false  |
| category       | string  | null: false  |
| condition      | string  | null: false  |
| delivery_charge| string  | null: false  |
| sender         | string  | null: false  |
| ship_date      | date    | null: false  |
| price          | integer | null: false  |

### Association
- has_one :purchase
- belongs_to :user

## shipテーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| post_code          | integer | null: false  |
| prefectures        | string  | null: false  |
| municipalities     | string  | null: false  |
| house_number       | integer | null: false  |
| house_name         | string  | null: false  |
| phone_number       | integer | null: false  |

### Association
- belongs_to :purchase

## purchaseテーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| user        | string | null: false |
| merch_name  | string | null: false |

### Association
- belongs_to :ship
- belongs_to :merch
- belongs_to :user