class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.text :image_data
      t.integer :starting_bid
      t.integer :increment
      t.integer :lot_number
      t.string :category
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
