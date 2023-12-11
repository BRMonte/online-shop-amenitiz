require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  let(:item) { create(:item, price: 5.55) }
  let(:order) { create(:order) }
  let!(:order_item_params) { { order_id: order.id, item_id: item.id, quantity: 1 } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new order item' do
        expect {
          post :create, params: { order_item: order_item_params }
        }.to change(OrderItem, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    let!(:order_item) { create(:order_item, order: order, item: item, quantity: 1) }

    context 'with valid attributes' do
      it 'updates the order item' do
        order_item.quantity = 2
        order_item.save

        expect(order_item.quantity).to eq(2)
      end
    end
  end
end
