FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    price { rand(0.1..15.0).round(2) }

    trait :with_code do
      code { CodeGeneratorService.new(self, { letters: 2, numbers: 1 }).call }
    end

    factory :item_with_code do
      with_code
    end
  end
end
