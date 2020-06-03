require 'open-uri'
require 'json'

json = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read

ingredient_hash = Hash.new
data = JSON.parse(json)
ingredient_hash = data["drinks"]

ingredient_hash.each do |ing|
  new_ingredient = Ingredient.create(name: ing["strIngredient1"])
end

current_user = User.current_scope
