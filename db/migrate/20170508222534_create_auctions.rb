class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :name_of_event
      t.string :organization
      t.text :image_data
      t.string :date
      t.string :start_time
      t.string :duration
      t.string :description

      t.timestamps
    end
  end
end
