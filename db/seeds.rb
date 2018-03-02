require 'open-uri'
require 'json'


Ingredient.destroy_all

ingredient_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = open(ingredient_url).read
result = JSON.parse(response)

p ings = result["drinks"]

ings.each { |ing| Ingredient.create(name: ing["strIngredient1"])}

puts "Created ingredients!"

Cocktail.destroy_all
Dose.destroy_all

DESCRIPTIONS = ['1 tbsp', '2 shots', '1/2']

c = Cocktail.new(name: "Random Cocktail")
c.ingredients << Ingredient.order("RANDOM()").first(3)
c.doses.each do |d|
  d.description = DESCRIPTIONS.sample
  d.save
end
c.save

puts "Created cocktails!"
