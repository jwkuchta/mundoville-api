class API::V1::FriendshipsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        friendships = Friendship.all 
        render json: friendships
    end

    def create
        # byebug
        f1 = Friendship.find_by(user_id: params['user_id'], friend_id: params['friend_id'])
        f2 = Friendship.find_by(user_id: params['friend_id'], friend_id: params['user_id'])
        existing = f1 || f2

        # byebug
        
        if existing == nil
            friendship = Friendship.new(user_id: params['user_id'], friend_id: params['friend_id'])
            if friendship.save
                render json: friendship, status: :accepted
            else
                render json: { error: "Unable to create friendship" }
            end
        end
    end

    def unfriend
        # byebug
        f1 = Friendship.find_by(user_id: params['user_id'], friend_id: params['friend_id']) 
        f2 = Friendship.find_by(user_id: params['friend_id'], friend_id: params['user_id'])
        friendship = f1 || f2

        # id = friendship.friend_id
        if friendship.destroy
            friendships = Friendship.all
            render json: friendship
        else
            render json: { error: "Unable to process unfriending" }
        end
    end

    private

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
    end
end



