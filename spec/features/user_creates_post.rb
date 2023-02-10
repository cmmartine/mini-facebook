require 'rails_helper'

RSpec.feature "User creates a post" do

  scenario "the post appears on the root_path" do

    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Create a new post"
    fill_in "post[body]", with: "Testing for post creation"
    click_on "Create Post"
    visit root_path
    expect(page).to have_text "Testing for post creation"
  end
end
