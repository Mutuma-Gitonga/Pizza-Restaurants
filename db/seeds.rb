puts '🌱 Seeding database...'

  restaurants = []
  5.times{restaurants << Restaurant.create(name:Faker::Restaurant.name, address: Faker::Address.street_address)}

  pizzas = []
  5.times{pizzas << Pizza.create(name:Faker::Food.dish, ingredients: Faker::Food.ingredient)}

  # restaurant_pizza = []
  10.times.each_with_index do |itm,idx|
    idx > 4? rp = idx - 5 : rp = idx
    # restaurant_pizza << 
    RestaurantPizza.create!(
    price: Faker::Number.between(from: 1, to: 30), 
    pizza_id: pizzas[rp].id, 
    restaurant_id: restaurants[rp].id
    ) 
  end 

  # rp = 0;
  # restaurants.each_with_index do |res,idx|
  #   # res = Restaurant.create(name:Faker::Restaurant.name, address: Faker::Address.street_address)
  #   idx == 0 ? rp = rp : rp+=1
    
  #   res.restaurant_pizzas << restaurant_pizza[rp]
  #   rp+=1
  #   res.restaurant_pizzas << restaurant_pizza[rp]
  # end

  # rp = restaurant_pizza.index(restaurant_pizza.last);
  # pizzas.each_with_index do |piz,idx|
  #   # piz = Pizza.create(name:Faker::Food.dish, ingredients: Faker::Food.ingredient)
  #   idx == 0 ? rp = rp : rp-=1
    
  #   piz.restaurant_pizzas << restaurant_pizza[rp]
  #   rp-=1
  #   piz.restaurant_pizzas << restaurant_pizza[rp]
  # end

puts '✅ Done seeding!'

  
  
