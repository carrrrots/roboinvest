class ChangeRemoveCandlestick < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :candlestick, :float, array: true, default: []
  end
end
