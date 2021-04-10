## Usersテーブル

|Column      |Type   |Options                  |
|------------|-------|-------------------------|
|nickname    |string |null: false              |
|email       |string |null: false, unique: true|
|password    |string |null: false              |
|name        |string |null: false              |
|name_reading|string |null: false              |
|birthday    |integer|null: false              |

### Association
- has_many :items
- has_many :orders

## Itemsテーブル

|Column     |Type      |Options                       |
|-----------|----------|------------------------------|
|name       |string    |null: false                   |
|description|text      |null: false                   |
|price      |integer   |null: false                   |
|user       |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## Ordersテーブル

|Column|Type      |Options                       |
|------|----------|------------------------------|
|price |integer   |null: false                   |
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## Shipping_addressesテーブル

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|postal_code  |string    |null: false                   |
|prefecture   |integer   |null: false                   |
|city         |string    |null: false                   |
|house_number |string    |null: false                   |
|building_name|string    |                              |
|phone_number |integer   |null: false                   |
|order        |references|null: false, foreign_key: true|

### Association
- belongs_to :order