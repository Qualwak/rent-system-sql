class DropLusersTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :lusers do |t|
      t.string  :name
      t.string  :email
      t.string  :password_digest

      t.timestamps null: false
    end
  end
end
