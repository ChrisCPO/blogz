class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :posts

  def handels
    [self.twitter_handel, self.github_handel]
  end

  def web_links
    ["http://www.twitter.com/#{twitter_handel}", "http://www.github.com/#{github_handel}"]
  end
end
