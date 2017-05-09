FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyString"
    image_data "MyText"
    starting_bid 1
    increment 1
    lot_number 1
    category "MyString"
    auction nil
  end
end
