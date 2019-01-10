class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password]) 
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user), status: 200
    else 
      render json: "Sorry Try Again", status: 401
    end
  end


  private

  def session_params 
    params.permit(:email, :password)
  end
end