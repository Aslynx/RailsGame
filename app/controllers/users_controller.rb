class UsersController < ApplicationController

    def create
      @user = User.new
  
      user_params_form
  
      flash.notice = "User '#{@user.username}' Created!"
    end
  
    def destroy
      @user = User.find(params[:id])
  
      @user.destroy
  
      redirect_to users_path()
  
      flash.notice = "User '#{@user.username}' Deleted!"
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def index
      @users = User.order('username asc').all
    end
  
    def new
      @user = User.new
    end

    def ranking
      @victories = User.order('nb_victories desc').all
      @defeats = User.order('nb_defeats desc').all
      @points = User.order('total_points desc').all
    end
  
    def show
      @user = User.find(params[:id])

      puts "====================================="
      puts @user.latitude
      puts @user.longitude

      @tournaments = Tournament.near(@user.geocode, 50)

      puts @tournaments

      @tournaments.each do |t|
        puts t.name 
      end

    end
  
    def update
      @user = User.find(params[:id])
  
      user_params_form
  
    end
  
    private
      def user_params_form

        if(check_user_params)
          @user.username = params[:user][:username]
          @user.street = params[:user][:street]
          @user.city = params[:user][:city]
          @user.state = params[:user][:state]
          @user.country = params[:user][:country]
          @user.avatar = params[:user][:avatar]
    
          @user.save
    
          redirect_to user_path(@user)

          flash.notice = "User '#{@user.username}' Updated!"
        else

          redirect_to edit_user_path(@user)

          flash.notice = "The edit had a problem. Please try again"
        end
        
      end

      def check_user_params
        if !check_username(params[:user][:username])
          puts "Username"
          return false
        elseif !check_street(params[:user][:street])
          puts "Street"
          return false
        elseif !check_address(params[:user][:city])
          puts "City"
          return false
        elseif !check_address(params[:user][:state])
          puts "State"
          return false
        elseif !check_address(params[:user][:country])
          puts "Country"
          return false
        else
          return true
        end
      end

      def check_object(object)
        return !object.empty?
      end

      def check_username(username)
        return check_object(username) && !username.match(/^[aA-zZ0-9]+([-._][a-z0-9]+)*$/i).nil?
      end

      def check_street(street)
        return check_object(street) && !street.match(/^[aA-zZ0-9]+([\s-][aA-zZ0-9]+)*$/i).nil?
      end

      def check_address(address)
        return check_object(address) && !address.match(/^[aA-zZ]+([-][aA-zZ]+)*$/i).nil?
      
      end

  end
  