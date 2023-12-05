class DropProductUserCategoryDiscountCategoryTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :users
    drop_table :products
    drop_table :categories
    drop_table :discounts
  end
end
