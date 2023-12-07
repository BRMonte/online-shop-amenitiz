require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new }

  describe 'associations' do
    it 'should have many order_items' do
      t = Order.reflect_on_association(:order_items)
      expect(t.macro).to eq(:has_many)
    end
  end

  describe 'callbacks' do
    it 'sets subtotal before saving' do
      order_item = create(:order_item, order: subject)
      expect(subject.subtotal).to eq(order_item.total_price)
    end
  end
end
