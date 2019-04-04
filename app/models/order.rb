class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates_presence_of :item_id, :user_id, :duration, :status, :description
end
