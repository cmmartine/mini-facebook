require 'rails_helper'

RSpec.feature "User accepts a request" do

  scenario "that user is now their friend" do

    user = FactoryBot.create(:user)
    User.create!(username: 'Becca', email: 'becca@email.com', password: 'becca1', password_confirmation: 'becca1', id: 2, confirmed_at: '1999-12-29 13:01:23 UTC', confirmation_sent_at: '1999-12-29 13:01:24 UTC')
    login_as(user, :scope => :user)
    Request.create!(receiving_user_id: 1, sending_user_id: 2)
    visit users_path
    click_on "Accept"
    visit user_path(id: 1)
    expect(page).to have_text "Becca"
  end
end
