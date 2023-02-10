require 'rails_helper'

RSpec.feature "User comments on a post" do

  scenario "the comment appears on the root_path" do

    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    FactoryBot.create(:post)
    visit root_path
    click_on "Comment"
    fill_in "comment[body]", with: "Testing for comment creation"
    click_on "Submit comment"
    visit root_path
    expect(page).to have_text "Testing for comment creation"
  end
end
