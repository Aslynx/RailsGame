class DashboardController < ApplicationController
    def index
        @tournaments = Tournament.all
        @games = Game.all
        @users = User.all
    end
end
