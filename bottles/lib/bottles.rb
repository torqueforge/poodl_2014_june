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
    next_bottle = to_bottle_number(number == 0 ? 99 : number - 1)

    "#{current_bottle.quantity} #{current_bottle.container} of beer on the wall, " +
    "#{current_bottle.quantity.downcase} #{current_bottle.container} of beer.\n" +
    "#{current_bottle.action}, " +
    "#{next_bottle.quantity.downcase} #{next_bottle.container} of beer on the wall.\n"
  end

  def to_bottle_number(number)
    if number == 0
      BottleNumber0.new(number)
    else
      BottleNumber.new(number)
    end
  end

end


class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def quantity
    "#{number}"
  end

  private

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    "No more"
  end

  def action
    "Go to the store and buy some more"
  end
end
