FactoryBot.define do
  factory :order_item do
    item { nil }
    order { nil }
    unit_price { 1.5 }
    quantity { 1 }
    total_price { 1.5 }
  end
end
