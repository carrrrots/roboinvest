class ChangeAddNewsAsArray < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :news, :text
  end
end
