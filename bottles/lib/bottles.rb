class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound
    .downto(lower_bound)
    .collect {|verse_number| verse(verse_number) }
    .join("\n")
  end

  def verse(number)
    current_bottle = to_bottle_number(number)
    next_bottle = to_bottle_number(current_bottle.next_number)

    "#{current_bottle.to_s.capitalize} #{current_bottle.container} of beer on the wall, " +
    "#{current_bottle} #{current_bottle.container} of beer.\n" +
    "#{current_bottle.action}, " +
    "#{next_bottle} #{next_bottle.container} of beer on the wall.\n"
  end

  def to_bottle_number(number)
    container = Container.for(number)

    if number == 0
      BottleNumber.new(Action::GoToTheStore.new, container, Description::NoMore.new, 99)
    else
      BottleNumber.new(Action::TakeOneDown.new(container), container, Description::Default.new(number), number - 1)
    end
  end

end

module Container
  def self.for(number)
    return Singular.new if number == 1
    Plural.new
  end

  class Singular
    def pronoun
      "it"
    end

    def to_s
      "bottle"
    end
  end

  class Plural
    def to_s
      "bottles"
    end

    def pronoun
      "one"
    end
  end
end

module Action
  class TakeOneDown
    attr_reader :container

    def initialize(container)
      @container = container
    end

    def to_s
      "Take #{container.pronoun} down and pass it around"
    end
  end

  class GoToTheStore
    def to_s
      "Go to the store and buy some more"
    end
  end
end

module Description
  class Default
    attr_reader :number

    def initialize(number)
      @number = number
    end

    def to_s
      number.to_s
    end
  end

  class NoMore
    def to_s
      "no more"
    end
  end
end

class BottleNumber
  attr_reader :action, :container, :description, :next_number

  def initialize(action, container, description, next_number)
    @action = action
    @container = container
    @description = description
    @next_number = next_number
  end

  def to_s
    description.to_s
  end
end
