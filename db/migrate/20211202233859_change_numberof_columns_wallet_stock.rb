class ChangeNumberofColumnsWalletStock < ActiveRecord::Migration[6.1]
  def change
    add_column :wallet_stocks, :array_stock, :float, array: true, default: []
  end
end
