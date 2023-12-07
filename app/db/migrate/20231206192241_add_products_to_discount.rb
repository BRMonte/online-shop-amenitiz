class AddProductsToDiscount < ActiveRecord::Migration[7.1]
  def change
    add_column :discounts, :promo_items, :string, array: true, default: []
  end
end
