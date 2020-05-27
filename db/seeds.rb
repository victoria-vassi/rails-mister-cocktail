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

puts 'Creating 6 cocktails...'

cocktails_attributes = [
   {
    name: "Gin & tonic",
    image_url: "https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80",
    description:"A gin and tonic is a highball cocktail made with gin and tonic water poured over a large amount of ice. The ratio of gin to tonic varies according to taste, strength of the gin, other drink mixers being added, etc., with most recipes calling for between a 1:1 to 1:3 ratio.",
    user: current_user
   },
   {
    name: "Old Cuban",
    image_url: "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    description: "If you drew a line between a Mojito and a French 75, the Old Cuban would sit squarely in the middle. Invented by Audrey Saunders, owner of Pegu Club in New York City, this cocktail combines aged run, lime juice, mint leaves, and Angostura bitters, before being topped off by a healthy splash of Champagne.",
    user: current_user
  },
  {
    name: "Long Island",
    image_url: "https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
    description: "A Long Island iced tea is a type of alcoholic mixed drink typically made with vodka, tequila, light rum, triple sec, gin, and a splash of cola, which gives the drink the same amber hue as its namesake.",
    user: current_user
  },
  {
    name: "New York Sour",
    image_url: "https://images.unsplash.com/photo-1566284628402-3f0895b3eb28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=688&q=80",
    description: "One of the most stunning and complex cocktail recipes out there is the New York Sour! First you have the whiskey sour layer: sweet tart and perfectly balanced, sweetened with maple for some nuance. Then float a layer of red wine over the top and it adds intrigue, complexity and a fruity acidity. Not to mention it looks simply stunning with the bright two-toned layer. A favorite!",
    user: current_user
   },
   {
    name: "Old Cuban",
    image_url: "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    description: "If you drew a line between a Mojito and a French 75, the Old Cuban would sit squarely in the middle. Invented by Audrey Saunders, owner of Pegu Club in New York City, this cocktail combines aged run, lime juice, mint leaves, and Angostura bitters, before being topped off by a healthy splash of Champagne.",
    user: current_user
  },
  {
    name: "Long Island",
    image_url: "https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
    description: "A Long Island iced tea is a type of alcoholic mixed drink typically made with vodka, tequila, light rum, triple sec, gin, and a splash of cola, which gives the drink the same amber hue as its namesake.",
    user: current_user
  }
]

cocktails_attributes.each do |cocktail|
  Cocktail.create!(cocktail)
end

puts "Finish creating 6 cocktails"

