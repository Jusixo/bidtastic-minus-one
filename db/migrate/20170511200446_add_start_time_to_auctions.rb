class AddStartTimeToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :start_time, :datetime
  end
end
