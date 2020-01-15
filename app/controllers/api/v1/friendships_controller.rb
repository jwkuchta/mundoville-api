class API::V1::FriendshipsController < ApplicationController

    def create
        friendship = Friendship.new(user_id: params['user_id'], friended_id: params['friended_id'])
        if friendship.save
            render json: friendship, status: :accepted
        else
            render json: { error: "Unable to create friendship" }
        end
    end

    def unfriend
        friendship = Friendship.find_by(user_id: params['user_id'], friended_id: params['friended_id'])
        id = friendship.friended_id
        if friendship.destroy
            render json: {message: id}
        else
            render json: { error: "Unable to process unfriending" }
        end
    end
end
