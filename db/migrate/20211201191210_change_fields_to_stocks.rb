class ChangeFieldsToStocks < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :market_capitalization, :decimal
    change_column :stocks, :description, :text
  end
end
