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

  describe "#author_date" do
    it "returns date created at" do
      post = create(:post)

      post_time = post.created_at
      answer = post_time.strftime("%d %m %Y")

      expect(post.author_date).to eq answer
    end
  end

  describe "#preview" do
    it "returns preview" do
      post = create(:post)
      answer = post.content[0..25] + "..."

      expect(post.preview).to eq answer
    end
  end
end
