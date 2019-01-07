class Api::V1::UsersController < ApiBaseController
  def create
    @user = User.new(user_params) if valid_password?
    if valid_password? && @user.save
      render json: UserSerializer.new(@user), status: 201
    else
      render json: "Woops Try Again", status: 422
    end
  end

  private

  def user_params
    params.permit(:accept)
    params.permit(:email, :password, :password_confirmation)
  end

  def valid_password?
    params[:password] == params[:password_confirmation]
  end
end