class WelcomeController < ApplicationController

    # skip_before_action :authorized, only: [:index]

    def index
        render json: "Welcome to the API".to_json
    end

end
