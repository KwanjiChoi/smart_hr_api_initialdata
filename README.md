# smart_hr_api_initialdata

smart_HRのAPIを使う機会があったので、
初期データを入れるプログラムを作成。

- 従業員のパラメータは、性、名、email、性別のみ。(リファレンス読むと必須項目はなしとのこと)
- Fakerで名前作成して、性別はランダム付与しているため、名前と性別があってない。



### initialize.rbの設定
```ruby:initialize.rb
require 'faker'

KEY = 'your_api_key'
BASE_URI = 'endpoint'
DELETE_ID = '' #従業員削除の際使用
Faker::Config.locale = :ja #fakerの日本語設定
```
