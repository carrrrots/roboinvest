class ChangeNumberOfColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :wallet_stocks, :date, :date
    add_column :wallet_stocks, :batch_cost, :float
  end
end
