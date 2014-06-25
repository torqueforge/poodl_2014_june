# Feel free to delete the instructions once you get going
puts instructions(__FILE__)

class Bottles

  def verse(number)
    return "2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.\n" if number == 2
    return "1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.\n" if number == 1
    return "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n" if number == 0

     "#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end

  def verses(end_verse, start_verse)
    end_verse.downto(start_verse).collect {|verse_number| verse(verse_number) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
