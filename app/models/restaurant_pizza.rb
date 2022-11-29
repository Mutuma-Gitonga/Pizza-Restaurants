class RestaurantPizza < ApplicationRecord
  validates :price, inclusion: {in: 1..30}

  belongs_to :pizza 
  belongs_to :restaurant 
end
