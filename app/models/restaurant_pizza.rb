class RestaurantPizza < ApplicationRecord
    belongs_to :restaurant
    belongs_to :pizza
    validates :price, length: { in: 1..30 }
end
