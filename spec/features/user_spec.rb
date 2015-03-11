require "rails_helper"

feature "User" do
  scenario "user can edit their info" do
    user = create(:user)
    twitter_link = "test_twitter"
    github_link = "test_github"

    sign_in(user)
    visit dashboard_path
    click_link "Edit Info"
    fill_in "Twitter handel", with: twitter_link
    fill_in "Github handel", with: github_link
    click_button "Save"

    expect(page).to have_text twitter_link
    expect(page).to have_text github_link
  end
end
