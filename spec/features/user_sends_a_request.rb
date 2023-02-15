require 'rails_helper'

RSpec.feature "User sends a request" do

  scenario "the send request button to that user is unavailable after it is sent" do

    user = FactoryBot.create(:user)
    User.create!(username: 'Becca', email: 'becca@email.com', password: 'becca1', password_confirmation: 'becca1', id: 2, confirmed_at: '1999-12-29 13:01:23 UTC', confirmation_sent_at: '1999-12-29 13:01:24 UTC')
    login_as(user, :scope => :user)
    visit users_path
    click_on "Send a friend request!"
    visit user_path(id: 2)
    expect(page).to have_text "Friend request has been sent already."
  end
end
