class AddImageToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :image, :text
  end
end