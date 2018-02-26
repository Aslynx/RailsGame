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
    end
  
    def update
      @user = User.find(params[:id])
  
      user_params_form
  
      flash.notice = "User '#{@user.username}' Updated!"
    end
  
    private
      def user_params_form
        @user.username = params[:user][:username]
        @user.street = params[:user][:street]
        @user.city = params[:user][:city]
        @user.state = params[:user][:state]
        @user.country = params[:user][:country]
        @user.avatar = params[:user][:avatar]
  
        @user.save
  
        redirect_to user_path(@user)
      end
  
  end
  