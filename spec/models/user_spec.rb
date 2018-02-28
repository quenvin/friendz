require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should validate username is unique' do
    is_expected.to validate_uniqueness_of(:username)
  end

  it 'should validate username is presence' do
    is_expected.to validate_presence_of(:username)
  end

  it 'should validate email is unique' do
    expect(sample_data).to validate_uniqueness_of(:email).case_insensitive
  end

  it 'should validate email is presence' do
    is_expected.to validate_presence_of(:email)
  end

  it 'should has many posts and depndent on destroy' do
    is_expected.to have_many(:posts).dependent(:destroy)
  end

  it 'should has one particular' do
    is_expected.to have_one(:particular)
  end

  it 'should has many likes' do
    is_expected.to have_many(:likes)
  end

  it 'should has active relationships' do
    is_expected.to have_many(:active_relationships).dependent(:destroy)
  end

  it 'should has passive relationships' do
    is_expected.to have_many(:passive_relationships).dependent(:destroy)
  end



  def sample_data
    user = User.new(username: "qq", email: "sample@email.com", password: "123456", sign_in_count: "10")
  end

end