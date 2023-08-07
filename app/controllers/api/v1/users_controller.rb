class Api::V1::UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def create
    @new_user = User.create(user_params)
    if @new_user.save
      render json: UserSerializer.new(@new_user), status: :created
    else
      render json: @new_user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :api_key)
  end
end
