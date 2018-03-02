class TournamentsController < ApplicationController

  def create
    @tournament = Tournament.new

    tournament_params_form

    User.all.each do |user|
      NotificationMailer.new_tournament_mail(user, @tournament).deliver
    end 

    flash.notice = "Tournament '#{@tournament.name}' Created!"
  end

  def destroy
    @tournament = Tournament.find(params[:id])

    @tournament.destroy

    redirect_to tournaments_path()

    flash.notice = "Tournament '#{@tournament.name}' Deleted!"
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def simulate
    # Found all participations
    @tournament = Tournament.find(params[:tournament_id])
    
    @matches = @tournament.participations.combination(2).to_a

    cpt = 1.to_i

    @matches.each do |m|
      if(m[0].games_tournament_id == m[1].games_tournament_id)
        @match = Match.new
        @match.participation_id = m[0].id
        @match.participation2_id = m[1].id

        @match.result_of_match

        @match.participation.user.add_score = @match.score_user1
        @match.participation2.user.add_score = @match.score_user2

        @match.save 
      end     
    end

    @tournament.participations.each do |user|
      @gt = GamesTournament.find(user.games_tournament_id)
      @game = Game.find(@gt.game_id)
      @user = User.find(user.user_id)
      NotificationMailer.simulate_tournament_mail(@user, @tournament, @game).deliver
    end

    respond_to do |simulate|
      simulate.js {}
      simulate.html {redirect_to tournament_path(@tournament), notice:'#{@tournament.name} has been simulated!'}
    end 

    
  end

  def show
    @tournament = Tournament.find(params[:id])

    @has_been_simulated = @tournament.matchs.empty?
  end

  def update
    @tournament = Tournament.find(params[:id])

    tournament_params_form

    flash.notice = "Tournament '#{@tournament.name}' Updated!"
  end

  private
    def tournament_params_form
      @tournament.name = params[:tournament][:name]
      @tournament.description = params[:tournament][:description]
      @tournament.street = params[:tournament][:street]
      @tournament.city = params[:tournament][:city]
      @tournament.state = params[:tournament][:state]
      @tournament.country = params[:tournament][:country]
      @tournament.max_players = params[:tournament][:max_players]
      @tournament.poster = params[:tournament][:poster]
      @tournament.game_list = params[:tournament][:game_list]

      @tournament.save

      redirect_to tournament_path(@tournament)
    end

end
