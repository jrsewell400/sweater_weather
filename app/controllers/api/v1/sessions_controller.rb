class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      render json: {body: UsersSerializer.new(user)}, status: 200
    else
      render json: {body: 'Invalid username and/or password'}, status: 400
    end
  end
end
