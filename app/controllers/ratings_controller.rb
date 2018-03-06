class RatingsController < ApplicationController
    def create 
        @rating = Rating.new()

        @game = Game.find(params[:game_id])

        puts "------------------"
        puts @game.title
        
        @rating.user_id = current_user.id
        puts "----------------"
        puts current_user.id
        @rating.game_id = params[:game_id]
        @rating.score = params[:rating][:score]

        @rating.save

        @average = @game.ratings.average(:score)

        respond_to do |create|
            create.js {}
            create.html {redirect_to game_path(@game), notice:'You have voted for ' +  @game.title}
        end 

    end
end
