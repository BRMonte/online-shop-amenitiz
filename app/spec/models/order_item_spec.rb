require 'rails_helper'
require 'rspec/rails'

RSpec.describe OrderItem, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(create(:order_item)).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to order' do
      order = Order.new
      order_item = order.order_items.new
      expect(order_item.order).to eq(order)
    end

    it 'has one item' do
      item = Item.new
      order_item = OrderItem.new(item: item)
      expect(order_item.item).to eq(item)
    end
  end

  describe '.unit_price' do
    it 'returns the associated item price' do
      item = create(:item, price: 10.99)
      order_item = create(:order_item, item: item)

      expect(order_item.unit_price).to eq(10.99)
    end
  end

  describe 'callbacks' do
    it 'sets unit_price before save' do
      item = Item.new(price: 5.0)
      order_item = OrderItem.new(item: item)

      item.price.freeze

      expect(order_item.unit_price).to eq(5.0)

      order_item.save

      expect(order_item.unit_price).to eq(5.0)
    end
  end

  describe 'methods' do
    it 'returns the item price as the unit price' do
      item = Item.new(price: 10.0)
      order_item = OrderItem.new(item: item)
      expect(order_item.unit_price).to eq(10.0)
    end

    it 'returns the unit price * quantity as total price' do
      item = Item.new(price: 5.0)
      order_item = OrderItem.new(item: item, quantity: 3)
      expect(order_item.total_price).to eq(15.0)
    end
  end
end
