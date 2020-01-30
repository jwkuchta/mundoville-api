class API::V1::ReviewsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        reviews = Review.all
        render json: reviews
    end

    def create
        # byebug
        review = Review.new(review_params)
        if review.save
            reviewedUser = User.find_by(id: params[:reviewed_id])
            reviews = Review.all.filter{ |r| r.reviewed_id == params[:reviewed_id] }
            totalRating = 0
            reviews.map {|r| totalRating += r.rating} 
            user.rating = totalRating / reviews.count
            if user.save
                render json: review
            end
        end
    end

    private

    def review_params
        params.require(:review).permit(:user_id, :reviewed_id, :rating, :body)
    end

end
