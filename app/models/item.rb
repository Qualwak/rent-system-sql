class Item < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_many :orders, dependent: :destroy

  # validates_presence_of :user_id, :title, :description, :price#, :duration #, :subcategory_id
end
