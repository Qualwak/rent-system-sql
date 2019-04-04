class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :items, dependent: :destroy

  validates_presence_of :title, :description, :category_id
end