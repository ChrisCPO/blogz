class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  acts_as_taggable

  belongs_to :user

  def author_date
    self.created_at.strftime("%d %m %Y")
  end

  def preview
    content[0..25] + "..."
  end
end
