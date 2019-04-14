require 'rails_helper'

# Test suite for the User model
RSpec.describe User, :type => :model do

  it { should have_many(:items).dependent(:destroy) }

  # ensure columns below are present for before saving
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:surname) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:role_id) }
end