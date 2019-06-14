class PokeType
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def pokemon
    #returns an array of all the pokemon associated with this poketype
    Pokemon.all.select do |pokemon|
      pokemon.poketype == self
    end
  end

  def self.create_five_poke_types
    type_array = ["Grass", "Poison", "Fire", "Water", "Bug"]
    type_array.each do |i|
      self.new(i)
    end
  end


end
