class ChangeRatiotoString < ActiveRecord::Migration[6.1]
  def change
    change_column :stocks, :pe_ratio, :string
  end
end
