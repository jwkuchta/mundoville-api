class API::V1::FriendshipsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        friendships = Friendship.all 
        render json: friendships
    end

    # def request
    #     f1 = Friendship.find_by(user_id: params['user_id'], friend_id: params['friend_id'])
    #     f2 = Friendship.find_by(user_id: params['friend_id'], friend_id: params['user_id'])
    #     existing = f1 || f2

    #     # byebug
        
    #     if existing == nil
    #         friendship = Friendship.new(user_id: params['user_id'], friend_id: params['friend_id'], friendship_request: 'pending')
    #         if friendship.save
    #             render json: friendship
    #         else
    #             render json: { error: "Unable to request friendship" }
    #         end
    #     end
    # end

    # def handle_request
    #     f1 = Friendship.find_by(user_id: params['user_id'], friend_id: params['friend_id'])
    #     f2 = Friendship.find_by(user_id: params['friend_id'], friend_id: params['user_id'])
    #     existing = f1 || f2
        
    #     if params['response'] == 'accepted'
    #         existing.update(friendship_request: 'accepted')
    #         render json: friendship
    #     elsif params['response'] == 'denied'
    #         existing.update(friendship_request: 'denied')
    #         render json: friendship
    #     else
    #         render json: {error: "Something went wrong while handling friendship request"}
    #     end
    # end

    def create
        byebug
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
        byebug
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
        params.require(:friendship).permit(:user_id, :friend_id, :response)
    end
end



