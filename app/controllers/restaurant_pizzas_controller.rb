class RestaurantPizzasController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_json

  def create
    @restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
    @pizza = Pizza.find(@restaurant_pizza.pizza_id)
    render json: @pizza
    
  end


  private 

  def restaurant_pizza_params
    params.permit(:price, :pizza_id, :restaurant_id)
  end

  def render_unprocessable_entity_json(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
