class RenameIncrementToBidIncrement < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :increment, :bid_increment
  end
end
