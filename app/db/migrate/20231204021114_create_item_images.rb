class CreateItemImages < ActiveRecord::Migration[7.1]
  def change
    create_table :item_images do |t|
      t.string :img_url
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
