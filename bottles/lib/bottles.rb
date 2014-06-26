class Bottles

  def verse(number)
    "#{quantity(number)} #{container(number)} of #{content} on the wall, " +
    "#{quantity(number).downcase} #{container(number)} of #{content}.\n" +
    "#{action(number)}, " +
    "#{quantity(next_number(number)).downcase} #{container(next_number(number))} of #{content} on the wall.\n"
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).collect {|verse_number| verse(verse_number) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def quantity(number)
    if number == 0
      "No more"
    else
      "#{number}"
    end
  end

  def next_number(number)
    if number == 0
      99
    else
      number - 1
    end
  end

  def content
    "beer"
  end

end
