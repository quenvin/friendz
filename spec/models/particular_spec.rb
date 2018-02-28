require "rails_helper"


RSpec.describe Particular, :type => :model do
 
  it "should belongs to user" do
    is_expected.to belong_to(:user)
  end

end