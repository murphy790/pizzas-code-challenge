class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        restaurant_pizzas = RestaurantPizza.all
        render json: restaurant_pizzas
    end
    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza 
    end
    private
    def restaurant_pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
    def render_not_found_response
        render json: { error: "RestaurantPizza not found" }, status: :not_found
      end
      def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
      end

end
