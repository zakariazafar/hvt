FactoryGirl.define do
  factory :menu_item do
    price '10.0'
    high_price '10.0'
    association :dish
  end
end
