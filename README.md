# テーブル設計

## users テーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many : items
- has_many : buys

## items テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false |
| explanation        | text       | null: false |
| category           | string     | null: false |
| item_status        | string     | null: false |
| shipping_cost      | integer    | null: false |
| shipping_source    | string     | null: false |
| shipping_date      | date       | null: false |
| price              | integer    | null: false |

### Association

- belongs_to : user
- belongs_to : buy

## buys テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| postcode           | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| block              | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |

### Association

- belongs_to : user
- belongs_to : item