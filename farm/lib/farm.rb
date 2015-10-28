using Article

class Farm
  attr_reader :animals

  def initialize(animals)
    @animals = animals
  end

  def lyrics
    animals.collect {|animal| verse(animal) }.join("\n\n")
  end

  def verse(animal)
    sound   = animal.sound
    species = animal.species
    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{species.articlize}, E-I-E-I-O,\n" +
    "With #{sound.articlize} #{sound} here " +
      "and #{sound.articlize} #{sound} there,\n" +
    "Here #{sound.articlize}, there #{sound.articlize}, " +
      "everywhere #{sound.articlize} #{sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."
  end
end

class FarmAnimal

  def self.all(ids)
    Animal.all(ids).map{|animal| animal || NoAnimal.new(animal) }
  end

end

class NoAnimal
  attr_reader :animal

  def initialize(animal)
    @animal = animal
  end

  def sound
    "<silence>"
  end

  def species
    "<silence>"
  end
end

