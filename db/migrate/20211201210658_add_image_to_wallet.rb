class AddImageToWallet < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :img_url, :string
  end
end
