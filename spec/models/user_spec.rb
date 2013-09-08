require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "#galleries" do
    it "has no gallery by default" do
      @user.should have(0).galleries
    end
    it "can create a gallery" do
      @user.galleries.create(title: "my gallery")
      @user.should have(1).gallery
    end
  end

end
