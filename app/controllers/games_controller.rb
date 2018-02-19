class GamesController < ApplicationController

  def create
    @game = Game.new

    game_params_form

    flash.notice = "Game '#{@game.title}' Created!"
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy
    @game.save

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

      @game.save

      redirect_to game_path(@game)
    end

end
