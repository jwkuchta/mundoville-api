class API::V1::ExchangesController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        exchanges = Exchange.all
        render json: exchanges, :include => [:messages]
        # render json: exchanges
    end

    def findExchanges
        # <ActionController::Parameters {"id"=>1, "controller"=>"api/v1/exchanges", 
        # "action"=>"findExchanges", "exchange"=>{"id"=>1}} permitted: false>
        # byebug
        exchanges = Exchange.where("first_user_id = ? OR second_user_id = ?", params[:id], params[:id])
        render json: exchanges, :include => [:messages]
    end
    
    def create
        # byebug
        if Exchange.between(params[:first_user_id], params[:second_user_id]).present?
            exchange = Exchange.between(params[:first_user_id], params[:second_user_id]).first
            message = Message.new(body: params[:body], exchange_id: exchange.id, user_id: params[:first_user_id])
            if message.save
                render json: exchange, :include => [:messages]
            end
        else
            exchange = Exchange.new(exchange_params)
            if exchange.save
                message = Message.new(body: params[:body], exchange_id: exchange.id, user_id: params[:first_user_id])
                if message.save
                    render json: exchange, :include => [:messages]
                end
            end
        end
    end

    private

    def exchange_params
        params.require(:exchange).permit(:first_user_id, :second_user_id, messages_attributes: [:body])
    end

end
