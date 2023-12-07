FactoryBot.define do
  factory :order_item do
    association :order
    association :item

    item
    quantity { 1 }
    total_price { (item.price * quantity).round(2) }
  end
end
