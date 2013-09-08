class Rating < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  validates_presence_of :score, :on => :create, :message => "can't be blank"
end
