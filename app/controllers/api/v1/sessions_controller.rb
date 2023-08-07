class Api::V1::SessionsController < ApplicationController
  
  def create
    # require 'pry'; binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  # private

  # def session_params
  #   params.permit(:email, :password)
  # end
end
