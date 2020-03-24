class API::V1::MessagesController < ApplicationController
    # skip_before_action :authorized, only: [:index]
    # skip_before_action :authorized

    def index
        messages = Message.all
        render json: messages 
    end

    def update
        message = Message.find_by(id: params[:id])
        message.read = true
        if message.save
            render json: message
        end
    end
    
end
