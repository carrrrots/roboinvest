class ChangeNewsToArray < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :news
  end
end
