##　users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| name                | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |

### Association

- has_many :report

## reports  テーブル

| Column | Type        | Options                         |
| -------| ----------- | ------------------------------- |
| title  | string      | null: false                     |
| text   | text        | null: false                     |
| user   | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user