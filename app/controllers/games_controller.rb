class GamesController < ApplicationController

  def create
    @game = Game.new

    game_params_form

    flash.notice = "Game '#{@game.title}' Created!"
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy

    redirect_to games_path()

    flash.notice = "Game '#{@game.title}' Deleted!"
  end

  def edit
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])

    @average = Rating.where(game_id: @game.id).average(:score)

    @rating = Rating.new
    @rating.game_id = @game.id
    if (!current_user.nil?)
      @rating.user_id = current_user.id    
      @has_voted = Rating.where(game_id: @rating.game_id, user_id: @rating.user_id).count()
    end
  end

  def update
    @game = Game.find(params[:id])

    game_params_form

    flash.notice = "Game '#{@game.title}' Updated!"
  end

  private
    def game_params_form
      @game.title = params[:game][:title]
      @game.description = params[:game][:description]
      @game.genre = params[:game][:genre]
      @game.image = params[:game][:image]

      @game.save

      redirect_to game_path(@game)
    end

end
