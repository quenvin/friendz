class HashtagsPost < ApplicationRecord
  belongs_to :post
  belongs_to :hashtag
end
