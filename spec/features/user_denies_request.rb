require 'rails_helper'

RSpec.feature "User denies a request" do

  scenario "that user is not their friend" do

    user = FactoryBot.create(:user)
    User.create!(username: 'Becca', email: 'becca@email.com', password: 'becca1', password_confirmation: 'becca1', id: 2)
    login_as(user, :scope => :user)
    Request.create!(receiving_user_id: 1, sending_user_id: 2)
    visit users_path
    click_on "Deny"
    visit user_path(id: 1)
    expect(page).not_to have_text "Becca"
  end
end
