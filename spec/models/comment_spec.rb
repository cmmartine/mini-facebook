require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body) }
  it { should belong_to(:user) }
  it { should belong_to(:post) }
end
