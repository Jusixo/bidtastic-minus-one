class AddCreatedByIdToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :created_by_id, :integer
  end
end
