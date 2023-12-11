FactoryBot.define do
  factory :order_item do
    association :order
    association :item, factory: :item

    quantity { 1 }
    total_price do
      item_price = item&.price || 0
      (item_price * quantity).round(2)
    end
  end
end
