require 'rails_helper'

RSpec.feature "User unlikes a post" do

  scenario "the post will then have 0 likes" do

    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    FactoryBot.create(:post)
    visit root_path
    click_on "Like"
    click_on "Liked"
    expect(page).to have_text "0 likes"
  end
end
