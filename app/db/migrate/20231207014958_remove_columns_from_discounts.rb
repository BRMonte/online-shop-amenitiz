class RemoveColumnsFromDiscounts < ActiveRecord::Migration[7.1]
  def change
    remove_column :discounts, :description, :text
    remove_column :discounts, :end_date, :datetime
    remove_column :discounts, :promo_items
  end
end
