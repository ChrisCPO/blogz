require "rails_helper"

feature "Post" do
  scenario "user can create new posts" do
    user = create(:user)
    title = "New Title here"
    content = "I'm a new Post"
    tag = "Thisisthetag"

    sign_in(user)
    visit dashboard_path
    click_link "New Post"
    fill_in "Tags", with: tag
    fill_in "Title", with: title
    fill_in "Content", with: content
    click_button "Post"

    expect(page).to have_text title
    expect(page).to have_text content
    expect(page).to have_text tag
  end

  scenario "Post is invaild" do
    user = create(:user)
    title = "New Title here"
    error = "Content can't be blank"

    sign_in(user)
    visit dashboard_path
    click_link "New Post"
    fill_in "Title", with: title
    click_button "Post"

    expect(page).to have_text error
  end
end
