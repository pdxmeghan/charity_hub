class ChangeBackToFloat < ActiveRecord::Migration
  def change
    remove_column :donations, :amount

    add_column :donations, :amount, :float
  end
end
