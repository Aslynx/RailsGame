class User < ActiveRecord::Base
  attr_accessible :username, :street, :city, :state, :country, :nb_victories, :nb_defeats, :total_points, :avatar

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
