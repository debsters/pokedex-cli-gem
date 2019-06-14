class Pokemon

  attr_accessor :name, :poketype, :number, :url, :description, :category, :abilities, :height, :weight, :type, :weakness

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

	def self.ordered_list
    @@all.each.sort_by { |pokemon| pokemon.number}
  end

end
