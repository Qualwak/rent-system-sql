class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :duration
      t.decimal :price
      t.references :user, foreign_key: true
      t.references :subcategory, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
