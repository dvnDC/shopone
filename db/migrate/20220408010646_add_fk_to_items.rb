class AddFkToItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :category
    add_reference :items, :subcategory, foreign_key: true
  end
end
