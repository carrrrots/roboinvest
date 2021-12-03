class CreateWalletStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :wallet_stocks do |t|
      t.float :investment_stock
      t.integer :number_of_stock
      t.references :wallet, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
