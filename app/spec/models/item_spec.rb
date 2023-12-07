require 'rails_helper'

RSpec.describe Item, type: :model do
  include FactoryBot::Syntax::Methods

  let(:item) { FactoryBot.build(:item) }

  it 'has a valid factory' do
    expect(create(:item)).to be_valid
  end

  describe 'associations' do
    it 'has many order items' do
      association = described_class.reflect_on_association(:order_items)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(item).to be_valid
    end

    it 'is not valid without a name' do
      item.name = nil
      expect(item).not_to be_valid
    end

    it 'is not valid without a price' do
      item.price = nil
      expect(item).not_to be_valid
    end
  end

  describe 'scopes' do
    let!(:item1) { create(:item, name: 'B', price: 10) }
    let!(:item2) { create(:item, name: 'A', price: 5) }

    it 'returns ordered by name' do
      expect(described_class.alphabetical).to eq([item2, item1])
    end

    it 'returns ordered by price' do
      expect(described_class.by_price).to eq([item2, item1])
    end
  end

  describe 'methods' do
    describe '.search' do
      let!(:item1) { create(:item, name: 'Green Shirt') }

      it 'returns all items when empty' do
        expect(described_class.search(nil)).to eq([item1])
      end

      it 'returns matching item by name' do
        expect(described_class.search('green')).to eq([item1])
      end
    end
  end
end
