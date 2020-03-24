class API::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]
  # skip_before_action :authorized

  def create
    # byebug
    @user = User.find_by(sub: user_login_params[:sub])
    if @user && @user.authenticate(user_login_params[:password])
      # token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      # render json: { message: 'Invalid username or password' }, status: :unauthorized
      render json: { message: 'Invalid username or password' }
    end
  end

  def show
    @user = User.find_by(sub: params['sub'])
    render json: @user
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password, :email, :sub)
  end
end
