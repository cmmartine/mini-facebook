require 'rails_helper'

RSpec.feature "User sends a request" do

  scenario "the send request button is unavailable" do

    user = FactoryBot.create(:user)
    User.create!(username: 'Becca', email: 'becca@email.com', password: 'becca1', password_confirmation: 'becca1', id: 2)
    login_as(user, :scope => :user)
    visit users_path
    click_on "Send Becca a friend request!"
    visit user_path(id: 2)
    expect(page).to have_text "Friend request has been sent already."
  end
end
