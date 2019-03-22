class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :duration
      t.integer :status
      t.text :description

      t.timestamps
    end
  end
end
