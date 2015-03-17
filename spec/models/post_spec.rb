require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe "Relationships" do
    it { is_expected.to belong_to(:user) }
  end

  describe "acts_as_taggable" do
    it "has tags" do
      post = Post.new
      post.title = "title"
      post.content = "content"
      tags = "New, Thing"

      post.tag_list.add(tags, parse: true)

      expect(post.tag_list).to include "New"
      expect(post.tag_list).to include "Thing"
    end
  end
end
