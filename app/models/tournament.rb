class Tournament < ActiveRecord::Base
  attr_accessible :name, :description, :street, :city, :state, :country, :max_players, :poster

  has_attached_file :poster
  validates_attachment_content_type :poster, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
