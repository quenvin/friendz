require 'rails_helper'

RSpec.describe HashtagsPost, :type => :model do
  
  it "should beongs to post" do
    is_expected.to belong_to(:post)
  end

  it "should beongs to hashtag" do
    is_expected.to belong_to(:hashtag)
  end

end