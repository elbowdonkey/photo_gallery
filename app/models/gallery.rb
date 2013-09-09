class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  validates_presence_of :title, :on => :create, :message => "can't be blank"
end
