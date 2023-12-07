# spec/controllers/order_items_controller_spec.rb
require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  let(:order) { create(:order) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new order item' do
        item_params = attributes_for(:order_item)
        expect {
          post :create, params: {order_id: order.id, order_item: item_params}
        }.to change(OrderItem, :count).by(1)
      end

      it 'sets the order_id in the session' do
        post :create, params: {order_id: order.id, order_item: attributes_for(:order_item)}
        expect(session[:order_id]).to eq(order.id)
      end
    end
  end

  describe 'PUT #update' do
    let!(:order_item) { create(:order_item, order: order) }

    context 'valid attributes' do
      let(:new_quantity) { 2 }
      it 'updates the order item' do
        put :update, params: {id: order_item.id, order_item: {quantity: new_quantity}}
        order_item.reload

        expect(order_item.quantity).to eq(new_quantity)
      end
    end
  end

end
