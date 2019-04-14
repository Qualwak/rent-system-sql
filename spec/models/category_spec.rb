require 'rails_helper'

# Test suite for the Category model
RSpec.describe Category, type: :model do
  # ensure Category model has 1:m relationship with the Subcategory model
  it { should have_many(:subcategories).dependent(:destroy) }

  # ensure columns below are present for before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end