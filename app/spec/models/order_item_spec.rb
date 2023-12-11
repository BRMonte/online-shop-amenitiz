require 'rails_helper'
require 'rspec/rails'

RSpec.describe OrderItem, type: :model do
  let(:item) { create(:item) }
  let(:order) { create(:order) }
  let(:order_item) { create(:order_item) }

  describe 'associations' do
    it 'belongs to order' do
      order_item = order.order_items.new
      expect(order_item.order).to eq(order)
    end

    it 'has one item' do
      item = Item.new
      order_item = OrderItem.new(item: item)
      expect(order_item.item).to eq(item)
    end
  end

  describe 'callbacks' do
    it 'sets unit_price before save' do
      item.price = 5.0
      order_item = OrderItem.new(item: item)

      expect(order_item.unit_price).to eq(5.0)
    end
  end

  describe 'methods' do
    describe '#unit_price' do
      it 'returns the item price as the unit price' do
        item = create(:item, price: 10.99)
        order_item = OrderItem.new(item: item)

        expect(order_item.unit_price).to eq(10.99)
      end
    end

    describe '#total_price' do
      it 'returns the unit price * quantity as total price' do
        item.price = 5.0
        order_item = OrderItem.new(item: item, quantity: 3)

        expect(order_item.total_price).to eq(15.0)
      end
    end
  end
end
