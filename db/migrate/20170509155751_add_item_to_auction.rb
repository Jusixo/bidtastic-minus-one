class AddItemToAuction < ActiveRecord::Migration[5.1]
  def change
    add_reference :auctions, :item, foreign_key: true
  end
end
