require 'spec_helper'

describe Gallery do
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:invalid_gallery) { FactoryGirl.build(:gallery) }

  describe "#title" do
    it "cannot be nil or blank" do
      gallery.title.should_not be_blank
    end

    it "should be invalid when blank" do
      invalid_gallery.title = ""
      invalid_gallery.should_not be_valid
    end
  end

  describe "#user" do
    it "should belong to a user" do
      gallery.user.should be_instance_of(User)
    end
  end

  describe "#photo_count" do
    it "should be updated when new photos are added" do
      gallery.photos.create(filepicker_url: "http://foo")
      gallery.reload
      expect(gallery.photos_count).to eq(1)
    end
  end
end
