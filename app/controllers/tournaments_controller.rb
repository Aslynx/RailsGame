class TournamentsController < ApplicationController

  def create
    @tournament = Tournament.new

    tournament_params_form

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

  def show
    @tournament = Tournament.find(params[:id])
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
