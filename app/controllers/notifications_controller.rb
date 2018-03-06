# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
    before_filter :authenticate_user!
  
    def index
      @notifications = Notification.where(recipient_id: current_user).unread
    end

    def mark_as_read
      #Maybe not the best solution
      @notifications = Notification.where(recipient_id: current_user).unread
      puts "============="
      puts @notifications
      if params[:id]
        @notification = Notification.find(params[:id])
        @notification.update_attribute(:read_at, Time.zone.now)
      else
        puts "Hi"
        @notifications.each do |n|
          n.update_attribute(:read_at, Time.zone.now)
        end
        #@notifications.update_all(:read_at, Time.zone.now)
      end

      puts "Ho"
  
      respond_to do |format|
        format.js
        format.json { render json: { success: true } }
      end
    end
  
    private
  
      def set_notifications
        
      end
  
  end