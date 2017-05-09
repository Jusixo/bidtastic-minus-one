class AddItemsToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_reference :auctions, :items, foreign_key: true
  end
end
