class ChangeDecimalToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :previous_close, :float
    change_column :stocks, :day_range_low, :float
    change_column :stocks, :day_range_high, :float
    change_column :stocks, :year_range_low, :float
    change_column :stocks, :year_range_high, :float
    change_column :stocks, :pe_ratio, :float
    change_column :stocks, :price_now, :float
  end
end
