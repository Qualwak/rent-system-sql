class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :password
      t.string :username
      t.string :email
      t.string :name
      t.string :surname
      t.string :phone
      t.integer :role_id

      t.timestamps
    end
  end
end
