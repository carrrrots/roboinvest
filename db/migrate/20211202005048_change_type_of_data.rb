class ChangeTypeOfData < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :previous_close, 'numeric USING CAST(previous_close AS numeric)'
    change_column :stocks, :day_range_low, 'numeric USING CAST(day_range_low AS numeric)'
    change_column :stocks, :day_range_high, 'numeric USING CAST(day_range_high AS numeric)'
    change_column :stocks, :market_cap, :string
    change_column :stocks, :volume, :string
    change_column :stocks, :dividend_yield, :string
    add_column :stocks, :price_now, :decimal
  end
end
