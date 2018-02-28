require "rails_helper"

RSpec.describe Relationship, :type => :model do


  it " should belongs to follower" do
    is_expected.to belong_to(:follower)
  end

  it " should belongs to follower" do
    is_expected.to belong_to(:following)
  end



    end
