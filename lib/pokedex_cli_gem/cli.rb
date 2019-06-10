class CommandLineInterface

  def run
    welcome
		Scraper.scrape_pokemon_list
		print_pokemon_list_from_number
		menu
    puts " "
		puts "Goodbye!".colorize(:color => :blue, :mode => :bold)
    puts " "
  end

	def welcome
    puts ""
    puts "Welcome to the".colorize(:color => :red, :mode => :bold) + " " + "Pokemon".colorize(:color => :yellow, :mode => :bold) + " " + "Pokedex!".colorize(:color => :red, :mode => :bold)
  end

	def menu
    input = ""

    while input != "exit" do
      puts "--------------------------------------------------------------".colorize(:color => :red, :mode => :bold)

      puts "To see details of a".colorize(:color => :light_blue, :mode => :bold) + " " + "Pokemon".colorize(:color => :yellow, :mode => :bold) + ", enter the number of the".colorize(:color => :light_blue, :mode => :bold) + " " + "Pokemon".colorize(:color => :yellow, :mode => :bold) + ".".colorize(:color => :blue, :mode => :bold)

      puts "To see the".colorize(:color => :light_blue, :mode => :bold) + " " + "Pokemon".colorize(:color => :yellow, :mode => :bold) + " " + "list again, enter 'list'.".colorize(:color => :light_blue, :mode => :bold)
      puts "To exit the program, enter 'exit'.".colorize(:color => :light_blue, :mode => :bold)
      puts "--------------------------------------------------------------".colorize(:color => :red, :mode => :bold)

      input = gets.strip.downcase

      if (1..809).include?(input.to_i)
        single_pokemon = Pokemon.ordered_list[input.to_i-1]
        Scraper.scrape_single_pokemon(single_pokemon) if !single_pokemon.category
        print_single_pokemon(single_pokemon)
      elsif input == "list"
        print_pokemon_list_from_number
      elsif input != "exit"
        puts "I'm sorry I didn't recognize that option. Please enter a valid option from the menu."
      end
    end
  end

	def print_pokemon_list_from_number
		puts ""
		puts "What".colorize(:color => :blue, :mode => :bold)+ " " + "Pokemon".colorize(:color => :yellow, :mode => :bold) + " " + "number would you like to see?".colorize(:color => :blue, :mode => :bold)

    puts "Enter a number from 1 - 809 to see 50".colorize(:color => :blue, :mode => :bold) + " " + "Pokemon".colorize(:color => :yellow, :mode => :bold) + " " + "from the number you've entered.".colorize(:color => :blue, :mode => :bold)
		from_number = gets.strip.to_i
		puts ""
    puts "-----------------------".colorize(:color => :red, :mode => :bold) + " Pokemon".colorize(:color => :yellow, :mode => :bold) + " #{from_number} - #{from_number+49} -----------------------".colorize(:color => :red, :mode => :bold)
    puts ""
    puts "--------------------------------------------------------------".colorize(:color => :red, :mode => :bold)
    Pokemon.ordered_list[from_number-1,50].each.with_index(from_number) do |pokemon, index|
      puts "#{index}.".colorize(:color => :yellow,:mode => :bold) + " " + "#{pokemon.name}".colorize(:color => :blue, :mode => :bold)
    end
  end

	def print_single_pokemon(pokemon)
      puts "--------------------------------------------------------------".colorize(:color => :red, :mode => :bold)
    puts ""
    puts "#{pokemon.name.upcase}".colorize(:color => :yellow, :mode => :bold)
    puts ""
    puts "Description:".colorize(:color => :blue, :mode => :bold)
    puts "#{pokemon.description}".colorize(:color => :red, :mode => :bold)
    puts ""
    puts "Category:".colorize(:color => :blue, :mode => :bold) + " #{pokemon.category}".colorize(:color => :red, :mode => :bold)
    puts ""
    puts "Abilities:".colorize(:color => :blue, :mode => :bold) + " #{pokemon.abilities}".colorize(:color => :red, :mode => :bold)
    puts ""
    puts "Height:".colorize(:color => :blue, :mode => :bold) + " #{pokemon.height}".colorize(:color => :red, :mode => :bold)
    puts ""
    puts "Weight:".colorize(:color => :blue, :mode => :bold) + " #{pokemon.weight}".colorize(:color => :red, :mode => :bold)
    puts ""
		puts "Type:".colorize(:color => :blue, :mode => :bold) + " #{pokemon.type}".colorize(:color => :red, :mode => :bold)
    puts ""
		puts "Weaknesses:".colorize(:color => :blue, :mode => :bold) + " #{pokemon.weakness}".colorize(:color => :red, :mode => :bold)
    puts ""
  end
end
