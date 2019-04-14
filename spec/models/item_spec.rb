require 'rails_helper'

# Test suite for the Item model
RSpec.describe Item, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:subcategory) }
  it { should have_many(:orders).dependent(:destroy) }

  # ensure columns below are present for before saving
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:duration) }
end