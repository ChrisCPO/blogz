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

    expect(user.posts.length).to eq 1
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

  scenario "user can see all of their posts" do
    user = create(:user)
    the_post = create(:post)
    user.posts << the_post

    sign_in(user)
    visit dashboard_path
    click_link "My Posts"

    expect(page).to have_text the_post.title
    expect(page).to have_text the_post.preview
  end

  scenario "tags are links to other posts" do
    user = create(:user)
    a_post = create(:post)
    user.posts << a_post

    sign_in(user)
    visit dashboard_path
    click_link "My Posts"
    click_link a_post.tags[0]

    expect(page).to have_text a_post.title
    expect(page).to have_text a_post.preview
  end
end
