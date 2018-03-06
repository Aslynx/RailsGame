class Notification < ActiveRecord::Base
  attr_accessible :action, :actor_id, :notifiable_id, :notifiable_type, :read_at, :recipient_id, :recipient, :actor, :notifiable

  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
end
