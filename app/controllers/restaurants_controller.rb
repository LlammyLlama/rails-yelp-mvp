class RestaurantsController < ApplicationController
  before_action :set_rest, only: %i[edit show update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(rest_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def show; end

  def update
    @restaurant.update(rest_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  # def top
  #   @restaurants = Restaurant.where(review.rating: 5)
  # end

  private

  def rest_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_rest
    @restaurant = Restaurant.find(params[:id])
  end
end
