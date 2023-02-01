require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:username) }
  it { should have_many(:friendships) }
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }
  it { should have_many(:sent_requests) }
  it { should have_many(:received_requests) }
end
