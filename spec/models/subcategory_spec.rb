require 'rails_helper'

# Test suite for the Subcategory model
RSpec.describe Subcategory, type: :model do

  it { should belong_to(:category) }
  it { should have_many(:items).dependent(:destroy) }

  # ensure columns below are present for before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:category_id) }
end