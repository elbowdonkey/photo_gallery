class Gallery < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :on => :create, :message => "can't be blank"
end
