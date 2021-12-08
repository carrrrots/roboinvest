class ChangeDescriptionToNewsArray < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :description, :news
  end
end
