class Bottles

  def verse(verse_number)
    if verse_number == 0 
      no_bottle_verse
    else
      has_bottles_verse(verse_number)
    end
  end

  def verses(first_verse, last_verse)
    first_verse.downto(last_verse).map do |bottles|
      verse(bottles)
    end.join("\n")
  end

  def no_bottle_verse
    "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
  end

  def has_bottles_verse(verse_number)
    "#{bottle_phrase(verse_number)} of beer on the wall, " +
      "#{bottle_phrase(verse_number)} of beer.\n" +
      "Take #{take_down_amount(verse_number)} down and pass it around, " +
      "#{bottle_phrase(verse_number - 1)} of beer on the wall.\n"
  end

  def bottle_phrase(verse_number)
    case verse_number
    when 1
      verse_phrase = "#{verse_number} bottle"
    when 0 
      verse_phrase = "no more bottles"
    else 
      verse_phrase = "#{verse_number} bottles"
    end
    verse_phrase
  end

  def take_down_amount(verse_number)
    verse_number == 1 ? "it" : "one" 
  end
end