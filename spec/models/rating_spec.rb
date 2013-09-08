require 'spec_helper'

describe Rating do
  before(:each) do
    @rating = FactoryGirl.build(:rating)
  end

  describe "#score" do
    it "cannot be nil or blank" do
      @rating.score.should_not be_blank
    end

    it "should be invalid when blank" do
      @rating.score = nil
      @rating.should_not be_valid
    end
  end

  describe "#user" do
    it "should belong to a user" do
      @rating.user.should be_instance_of(User)
    end
  end

  describe "#photo" do
    it "should belong to a photo" do
      @rating.photo.should be_instance_of(Photo)
    end
  end
end
