class ChangeWalletColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallets, :money, :decimal
    change_column :wallets, :invested_money, :float
    change_column :wallets, :profit, :float
  end
end
