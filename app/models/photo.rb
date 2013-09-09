class Photo < ActiveRecord::Base
  belongs_to :gallery, :counter_cache => true
  validates_presence_of :filepicker_url, :on => :create, :message => "can't be blank"
end
