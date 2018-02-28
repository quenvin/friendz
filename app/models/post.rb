class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :hashtags_posts

  has_many :hashtags, through: :hashtags_posts

end
