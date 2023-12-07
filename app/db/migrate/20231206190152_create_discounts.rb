class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.boolean :active
      t.text :description
      t.datetime :end_date

      t.timestamps
    end
  end
end
