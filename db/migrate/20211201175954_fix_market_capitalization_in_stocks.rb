class FixMarketCapitalizationInStocks < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :market_captalization, :market_capitalization
  end
end
