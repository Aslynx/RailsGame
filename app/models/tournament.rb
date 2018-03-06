class Tournament < ActiveRecord::Base
  #after_create :create_notifications

  has_many :games_tournaments
  has_many :games, through: :games_tournaments
  has_many :participations, through: :games_tournaments
  has_many :users, through: :participations
  has_many :matchs, through: :participations

  has_attached_file :poster
  validates_attachment_content_type :poster, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  attr_accessible :name, :description, :street, :city, :state, :country, :max_players, :poster, :game_list, :recipient, :actor, :notifiable

  geocoded_by :address   # can also be an IP address
  after_validation :geocode      # auto-fetch coordinates

  def address
    [street, city, state, country].compact.join(', ')
  end

  def create_notifications(user)
    @user = user
    recipients.each do |recipient|
      #Notification.create(recipient: recipient, actor: @user,
       # action: 'posted', notifiable: self)
       @notif = Notification.new
       @notif.recipient = recipient
       @notif.actor = @user
       @notif.action = 'posted'
       @notif.notifiable = self
       @notif.save

    end
  end

  def game_list
    self.games.collect do |game|
      game.title
    end.join(", ")
  end

  def game_list=(games_string)
    games_titles = games_string[1..-1].split(",").collect{|s| s}
    found_games = games_titles.collect{|title| Game.where(title: title)}
    if !found_games.nil?
      found_games.each do |f|
        self.games += f
      end
    end
  end

  def recipients
    User.all
  end

end
