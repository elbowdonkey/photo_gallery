class Photo < ActiveRecord::Base
  belongs_to :gallery
  validates_presence_of :filepicker_url, :on => :create, :message => "can't be blank"
end
