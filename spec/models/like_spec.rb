require 'rails_helper'

RSpec.describe Like, :type => :model do
  

it "should belongs_to post" do
is_expected.to belong_to(:post)
end

it "should belongs_to user" do
  is_expected.to belong_to(:user)
end


end