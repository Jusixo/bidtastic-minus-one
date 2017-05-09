class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :email
      t.string :uid
      t.string :access_token

      t.timestamps
    end
  end
end
