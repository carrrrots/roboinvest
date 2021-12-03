class ChangeRemoveCollumnFromWalletStock < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallet_stocks, :array_stock, :float, array: true, default: []
    add_column :stocks, :array_stock, :float, array: true, default: []
  end
end
