FactoryBot.define do
  factory :report do
    title              { 'テスト' }
    text               { 'テスト' }
    association :user
  end
end
