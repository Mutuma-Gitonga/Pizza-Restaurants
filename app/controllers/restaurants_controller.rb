class RestaurantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def index 
    @restaurants = Restaurant.all 
    render json: @restaurants, status: :ok 
    
    # json_response(@restaurants, status = 200)
  end

  def show 
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant, serializer: RestaurantWithPizzaSerializer, status: :ok 
  end

  def destroy 
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    head :no_content
  end


  private
  def render_record_not_found 
    render json: {error: "Restaurant not found"}, status: :not_found
  end
end
