require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should belong_to(:receiving_user) }
  it { should belong_to(:sending_user) }
end
