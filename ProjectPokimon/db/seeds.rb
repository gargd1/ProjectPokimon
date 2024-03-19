# Clear existing data
PokimonName.destroy_all
Type.destroy_all
Form.destroy_all
Ability.destroy_all

require 'faker'
require 'httparty'

# Method to fetch data from the Pokémon API
def fetch_pokemon_data(url)
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

# Fetch data from the first API to get the list of Pokémon
pokemon_api_url = 'https://pokeapi.co/api/v2/pokemon?limit=200&offset=0'
pokemon_data = fetch_pokemon_data(pokemon_api_url)

pokemon_data['results'].each do |pokemon|
  # Fetch detailed data for the Pokémon
  detailed_pokemon_data = fetch_pokemon_data(pokemon['url'])

  # Create PokimonName record
  pokimon_name = PokimonName.create!(name: detailed_pokemon_data['name']) # Removed the category association

  # Create Type records
  detailed_pokemon_data['types'].each do |type_data|
    type_name = type_data['type']['name']
    Type.create!(name: type_name, pokimon_name: pokimon_name)
  end

  # Create Ability records
  detailed_pokemon_data['abilities'].each do |ability_data|
    ability_name = ability_data['ability']['name']
    Ability.create!(name: ability_name, pokimon_name: pokimon_name)
  end

  # Create Form records
  detailed_pokemon_data['forms'].each do |form_data| # Corrected here
    form_name = form_data['name']
    Form.create!(name: form_name, pokimon_name: pokimon_name)
  end # Corrected here
end

puts 'Sample data seeded successfully!'
