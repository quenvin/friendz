require "rails_helper"

  RSpec.describe Post, type: :model do

    it 'should belongs to user model' do
      is_expected.to belong_to(:user)
    end    
    
    it 'should has many likes' do
      is_expected.to have_many(:likes)
    end

    it 'should has many hastags post' do
      is_expected.to have_many(:hashtags_posts)
    end

    it 'should has many hastags' do
      is_expected.to have_many(:hashtags)
    end


  end