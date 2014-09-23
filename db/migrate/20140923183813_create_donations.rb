class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.float :amount
      t.integer :charity_id
      t.string :token

      t.timestamps
    end
  end
end
