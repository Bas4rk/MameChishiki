FactoryBot.define do
  factory :user do
    sequence(:id){|n| "#{n}"}
    sequence(:username) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { "123456"}
  end
end
