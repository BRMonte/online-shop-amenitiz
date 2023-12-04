FactoryBot.define do
  factory :item do
    name { "MyString" }
    price { 1.5 }
    code { 'UP2' }
    slug { name.parameterize }
  end
end
