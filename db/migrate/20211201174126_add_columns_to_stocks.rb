class AddColumnsToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :description, :string
    add_column :stocks, :exchange, :string
    add_column :stocks, :country, :string
    add_column :stocks, :sector, :string
    add_column :stocks, :industry, :string
    add_column :stocks, :market_captalization, :integer
    add_column :stocks, :bookvalue, :decimal
    add_column :stocks, :dividend_per_share, :decimal
    add_column :stocks, :dividend_yield, :decimal
    add_column :stocks, :profit_margin, :decimal
    add_column :stocks, :analyst_target_price, :decimal
  end
end
