class Scraper

  def self.scrape_pokemon_list
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/national"))

		doc.css(".infocard").each do |i|
			pokemon = Pokemon.new
			pokemon.name = i.css("a.ent-name")[0].text
			pokemon.number = i.css("small")[0].text
			pokemon.url = i.css("a.ent-name")[0].attribute("href").value
      pokemon.poketype = PokeType.all.sample
  	end
	end

	def self.scrape_single_pokemon(pokemon)
		doc = Nokogiri::HTML(open("https://www.pokemon.com/us#{pokemon.url}"), nil, 'utf-8')
		pokemon.name = doc.css("div.pokedex-pokemon-pagination-title div").text.split[0]
		pokemon.description = doc.css("p.version-y")[0].text.strip.gsub("\n", " ")
		pokemon.category = doc.css("span.attribute-value")[3].text
		pokemon.abilities = doc.css("span.attribute-value")[4].text
		pokemon.height = doc.css("span.attribute-value")[0].text.split.join
		pokemon.weight = doc.css("span.attribute-value")[1].text
		#pokemon.type = doc.css(".dtm-type li").text.strip.gsub(/\W/, "").split(/(?=[A-Z])/)
		pokemon.weakness = doc.css(".dtm-weaknesses ul")[0].text.strip.gsub(/\W/, "").split(/(?=[A-Z])/)
	end

end
