require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    it 'sorts items by price in ascending order' do
      items = create_list(:item, 3)
      get :index, params: { sort: 'price' }
      expect(controller.instance_variable_get(:@items)).to eq(items.sort_by(&:price))
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Item' do
        expect {
          post :create, params: { item: { name: 'New Item', description: 'This is a new item.', price: 10.0 } }
        }.to change(Item, :count).by(1)
      end

      it 'assigns a newly created item to @item' do
        post :create, params: { item: { name: 'New Item', description: 'This is a new item.', price: 10.0 } }
        expect(controller.instance_variable_get(:@item)).to be_a(Item)
        expect(controller.instance_variable_get(:@item)).to be_persisted
      end
    end

    context 'with invalid parameters' do
      it 'assigns a newly created (but unsaved) item to @item' do
        post :create, params: { item: { name: '', description: 'This is a new item.', price: 10.0 } }
        expect(controller.instance_variable_get(:@item)).to be_a_new(Item)
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested item to @item' do
      item = create(:item)
      get :edit, params: { id: item.id }
      expect(controller.instance_variable_get(:@item)).to eq(item)
    end
  end
end

