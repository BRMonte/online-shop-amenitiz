# spec/helpers/order_items_helper_spec.rb
require 'rails_helper'

RSpec.describe OrderItemsHelper, type: :helper do
  let(:order) { create(:order) }
  let(:order_item) { create(:order_item, order: order) }
  let(:order_items) { order.order_items }

  before do
    order_items << order_item
  end


  describe '#order_has_items?' do
    it 'returns true when there are order items' do
      expect(helper.order_has_items?(order_items)).to eq(true)
    end

    it 'returns false when there are no order items' do
      order.order_items.destroy_all
      expect(helper.order_has_items?(order.order_items)).to be_falsey
    end
  end

  describe '#get_item_name' do
    it 'returns the item name' do
      expect(helper.get_item_name(order_item)).to eq(order_item.item.name)
    end
  end

  describe '#get_item_individual_price' do
    it 'returns the item price' do
      expect(helper.get_item_individual_price(order_item)).to eq(order_item.item.price)
    end
  end

  describe '#get_item_quantity' do
    it 'returns the order item quantity' do
      expect(helper.get_item_quantity(order_item)).to eq(order_item.quantity.to_i)
    end
  end

  describe '#get_item_total_price' do
    it 'returns the order item total price' do
      expect(helper.get_item_total_price(order_item)).to eq(order_item.total_price.round(2))
    end
  end

  describe '#get_cart_subtotal_price' do
    it 'returns the order subtotal' do
      expect(helper.get_cart_subtotal_price(order_items)).to eq(order_items.first.order.subtotal.round(2))
    end
  end

  describe '#get_cart_total_price' do
    it 'returns the order total price after applying discounts' do
      allow_any_instance_of(ApplyDiscountService).to receive(:call)
      expect(helper.get_cart_total_price(order_items)).to eq(order_items.first.order.subtotal)
    end
  end
end
