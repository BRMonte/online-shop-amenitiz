require 'rails_helper'

RSpec.describe OrderItemsHelper, type: :helper do

  let(:order_item) { create(:order_item) }
  let(:order_items) { create_list(:order_item, 3) }

  describe '#order_has_items?' do
    it 'returns true if order has items' do
      expect(helper.order_has_items?(order_items)).to eq(true)
    end

    it 'returns false if order has no items' do
      empty_order_items = []
      expect(helper.order_has_items?(empty_order_items)).to eq(false)
    end
  end

  describe '#get_item_name' do
    it 'returns the name for the order item' do
      name = order_item.item.name
      expect(helper.get_item_name(order_item)).to eq(name)
    end
  end
end
