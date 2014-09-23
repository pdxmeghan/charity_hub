class ChangeIntegerToFloat < ActiveRecord::Migration
  def change
    remove_column :donations, :amount

    add_column :donations, :amount, :integer
  end
end
