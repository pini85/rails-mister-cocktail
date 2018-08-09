# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

doc = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(doc)

ingredients['drinks'].each do |ingredient|
  # {"strIngredient1"=>"Light rum"}
  name = ingredient['strIngredient1']
  Ingredient.create!(name: name)
end

cocktail = Cocktail.create(name: 'Old Fashioned')

Dose.create(
  amount: "5cl",
  cocktail: cocktail,
  ingredient: Ingredient.find_by(name: 'Vermouth')
)

Dose.create(
  amount: "2cl",
  cocktail: cocktail,
  ingredient: Ingredient.find_by(name: 'Vodka')
)



