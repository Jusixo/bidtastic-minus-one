class RemoveDateFromAuctions < ActiveRecord::Migration[5.1]
  def change
    remove_column :auctions, :date, :string
  end
end
