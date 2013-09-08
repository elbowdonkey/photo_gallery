require 'spec_helper'

describe Photo do
  before(:each) do
    @photo = FactoryGirl.build(:photo)
  end

  describe "#filepicker_url" do
    it "cannot be nil or blank" do
      @photo.filepicker_url.should_not be_blank
    end

    it "should be invalid when blank" do
      @photo.filepicker_url = ""
      @photo.should_not be_valid
    end
  end

  describe "#gallery" do
    it "should belong to a gallery" do
      @photo.gallery.should be_instance_of(Gallery)
    end
  end
end
