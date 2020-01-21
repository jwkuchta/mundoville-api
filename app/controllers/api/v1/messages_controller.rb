class API::V1::MessagesController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        messages = Message.all
        render json: messages 
        # :include => [:username, :email, :bio, :frienders, :friendeds]
        # :include => [:username, :email, :bio, :country, :city, :language1, :language2, :language3, :profile_pic]
    end

    def update
        message = Message.find_by(id: params[:id])
        message.read = true
        if message.save
            render json: message
        end
    end
    
end
