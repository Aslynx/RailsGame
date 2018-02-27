class ParticipationsController < ApplicationController

    def create 
        @participation = Participation.new

        participation_params_form

        redirect_to participations_path
    end

    def index
        @tournaments = Tournament.all
    end

    def new
        @participation = Participation.new

        @tournament = Tournament.find(params[:tournament])
        @game = Game.find(params[:game])
        @user = User.find(params[:user])
    end

    private 
        def participation_params_form
            @user = User.find(params[:participation][:user])

            @user.inscription(params[:participation][:game], params[:participation][:tournament])

        end
end
