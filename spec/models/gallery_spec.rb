require 'spec_helper'

describe Gallery do
  before(:each) do
    @gallery = FactoryGirl.build(:gallery)
  end

  describe "#title" do
    it "cannot be nil or blank" do
      @gallery.title.should_not be_blank
    end

    it "should be invalid when blank" do
      @gallery.title = ""
      @gallery.should_not be_valid
    end
  end

  describe "#user" do
    it "should belong to a user" do
      @gallery.user.should be_instance_of(User)
    end
  end
end
