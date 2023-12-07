class AddOnSaleToDiscounts < ActiveRecord::Migration[7.1]
  def change
    add_column :discounts, :on_sale, :string
  end
end
