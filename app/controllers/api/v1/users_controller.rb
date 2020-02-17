class API::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]
  # raise: false 
  # raise: false has to be added to this since recently to prevent error
  include Rails.application.routes.url_helpers

  def index
      @users = User.all
      render json: @users, :except => [:password_digest], 
      :include => [:reviews, :friendships]
  end

  def show
    @user = User.find_by(id: params['id'])
    render json: @user, :except => [:password_digest]
  end

  def profile
    @user = current_user
    render json: @user, :except => [:password_digest],
    :include => [:reviews, :friendships]
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    # byebug
      @user = User.find_by(id: params['id'])

      if @user.profile_pic != nil && user_params['profile_pic'] != nil 
        @user.profile_pic.detach()
      end
      if @user.update(user_params)
          render json: { message: 'user successfully updated' }
      else
          render json: { message: 'could not update user'}
      end
  end

  def destroy
      user = User.find_by(id: params['id'])
      if user.destroy
          render json: { message: 'User successfully destroyed' }
      else
          render json: { message: 'Could not delete user. Please try again.'}
      end
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :first_name, :profile_pic, :last_name, :email, :password, :bio, :country, :city, :language1, :language2, :language3)
  end
  
end