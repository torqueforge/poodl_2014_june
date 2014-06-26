class Farm
  using Article
  attr_reader :animals

  def initialize(animal_list)
    @animals = Animal.all(animal_list)
  end

  def animal_name(animal)
    animal.species
  end

  def animal_sound(animal)
    animal.sound
  end

  def lyrics
    animals.collect do |animal|
      "Old MacDonald had a farm, E-I-E-I-O,
And on that farm he had #{animal_name(animal).articlize}, E-I-E-I-O,
With #{animal_sound(animal).articlize} #{animal_sound(animal)} here and #{animal_sound(animal).articlize} #{animal_sound(animal)} there,
Here #{animal_sound(animal).articlize}, there #{animal_sound(animal).articlize}, everywhere #{animal_sound(animal).articlize} #{animal_sound(animal)},
Old MacDonald had a farm, E-I-E-I-O."
    end.join("\n\n")
  end

end
