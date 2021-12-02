class ChangeSchemaNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :exchange, :previous_close
    rename_column :stocks, :sector, :day_range_low
    rename_column :stocks, :industry, :day_range_high
    rename_column :stocks, :market_capitalization, :year_range_low
    rename_column :stocks, :bookvalue, :year_range_high
    rename_column :stocks, :dividend_per_share, :market_cap
    rename_column :stocks, :dividend_yield, :volume
    rename_column :stocks, :profit_margin, :pe_ratio
    rename_column :stocks, :analyst_target_price, :dividend_yield
    add_column :stocks, :primary_exchange, :string
  end
end
