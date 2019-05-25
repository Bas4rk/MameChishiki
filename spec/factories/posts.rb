FactoryBot.define do 
  factory :post do
    sequence(:id) {|n| "#{n}"}
    sequence(:user_id) {|n| "#{n}"}
    sequence(:content) {|n| "テキスト#{n}"}
  end
end



