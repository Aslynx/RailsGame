class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_tournament_mail(user, tournament)
    @user = user
    @tournament = tournament
    mail(to: @user.email, subject: 'New Tournament')
  end

  def simulate_tournament_mail(user, tournament, game)
    @user = user
    @tournament = tournament
    @game = game
    mail(to: @user.email, subject: 'Tournament Finished')
  end
end
