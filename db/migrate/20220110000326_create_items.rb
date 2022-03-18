class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category
      t.decimal :price, precision: 5, scale: 2
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :items, [:user_id, :created_at]
  end
end
