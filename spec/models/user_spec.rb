require "rails_helper"

RSpec.describe User, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many(:posts) }
  end

  describe "#links" do
    it "returns handles for github and twitter" do
      user = create(:user)
      user.twitter_handel = "test_twitter"
      user.github_handel = "test_github"

      expect(user.handels).to include "test_github"
      expect(user.handels).to include "test_twitter"
    end
  end

  describe "#user_links" do
    it "returns links for github and twitter" do
      user = create(:user)
      user.twitter_handel = "test_twitter"
      user.github_handel = "test_github"

      expect(user.web_links).to include "http://www.twitter.com/test_twitter"
      expect(user.web_links).to include "http://www.github.com/test_github"
    end
  end

  describe "#add_post" do
    it "returns links for github and twitter" do
      user = create(:user)
      post = create(:post)

      user.add_post(post)

      expect(user.posts).to include post
    end
  end
end
