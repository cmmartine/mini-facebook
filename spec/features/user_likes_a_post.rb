require 'rails_helper'

RSpec.feature "User likes a post" do

  scenario "the post will then have 1 like" do

    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    FactoryBot.create(:post)
    visit root_path
    click_on "Like"
    expect(page).to have_text "1 likes"
  end
end
