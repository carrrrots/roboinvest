class ChangeWalletColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallets, :money, :decimal
    change_column :wallets, :invested_money, :float, default: 0.00
    change_column :wallets, :profit, :float, default: 0.00
  end
end
