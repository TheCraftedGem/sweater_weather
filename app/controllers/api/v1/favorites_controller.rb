class Api::V1::FavoritesController < ApplicationController
  def create 
    if  find_by_api_key
      @user = find_by_api_key
      @user.favorites.create(location: params[:location])
      render json: FavoritesSerializer.new(@user.favorites.last), status: 201
    else
      render json: 'Error', status: 401
    end
  end

  def show
    if find_by_api_key
      @user = find_by_api_key
      favorite_location = UserFavorites.new(@user.favorites)
      render json: UserFavoritesSerializer.new(favorite_location.current_weather)
    else 
      render json: 'Error', status: 401
    end
  end

  def destroy 
    if find_by_api_key
      @user = find_by_api_key
      @user.favorites.destroy(@user.favorites.where(location: params[:location]))
      favorite_location = UserFavorites.new(@user.favorites)
      render json: UserFavoritesSerializer.new(favorite_location.current_weather), status: 200
    else
      render json: 'Error', status: 401
    end
  end

private
  def find_by_api_key
    User.find_by(api_key: params[:api_key])
  end
end