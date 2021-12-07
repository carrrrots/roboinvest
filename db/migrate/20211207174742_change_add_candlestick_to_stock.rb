class ChangeAddCandlestickToStock < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :candlestick, :float, array: true, default: []
  end
end
