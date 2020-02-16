class WelcomeController < ApplicationController

    def index
        render json: "Welcome to the API".to_json
    end
    
end
