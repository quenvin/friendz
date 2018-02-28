require 'rails_helper'

RSpec.describe Hashtag, :type => :model do
  
  it "should has many hastags posts" do
    is_expected.to have_many(:hashtags_posts)
  end

end