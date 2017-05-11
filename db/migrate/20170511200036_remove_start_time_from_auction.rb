class RemoveStartTimeFromAuction < ActiveRecord::Migration[5.1]
  def change
    remove_column :auctions, :start_time, :string
  end
end
