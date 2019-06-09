class CommandLineInterface

  def run
    welcome
		Scraper.scrape_pokemon_list
		print_pokemon_list
  end

	def welcome
    puts ""
    puts "Welcome to the Pokemon Pokedex!"
  end

	def print_pokemon_list
    puts "---------------------------------------------------------"
    Pokemon.ordered_list.each.with_index(1) do |pokemon, index|
      puts "#{index}. #{pokemon.name}"
    end
  end



end
