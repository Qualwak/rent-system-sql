require 'rails_helper'

# Test suite for the Order model
RSpec.describe Order, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:item) }

  # ensure columns below are present for before saving
  it { should validate_presence_of(:item_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:description) }
end