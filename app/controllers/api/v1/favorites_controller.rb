class Api::V1::FavoritesController < ApplicationController
  before_action :validate_user

  def create 
    current_user.favorites.create(location: params[:location])
    render json: FavoritesSerializer.new(current_user.favorites.last), status: 201
  end

  def show
    favorite_location = UserFavorites.new(current_user.favorites)
    render json: UserFavoritesSerializer.new(favorite_location.current_weather)
  end

  def destroy 
    current_user.favorites.destroy(current_user.favorites.where(location: params[:location]))
    favorite_location = UserFavorites.new(current_user.favorites)
    render json: UserFavoritesSerializer.new(favorite_location.current_weather), status: 200
  end
end