class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)
    
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" + 
    "#{bottle_number.action}, " +
    "#{bottle_number.next} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      BottleNumber
    end.new(number)
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def next
    BottleNumber.for(number-1)
  end

  def action
    "Take #{serving} down and pass it around"
  end

  def serving
    "one"
  end

  def quantity
    number.to_s
  end

  def container
    "bottles"
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    "no more"
  end

  def next
    BottleNumber.for(99)
  end

  def action
    "Go to the store and buy some more"
  end
end

class BottleNumber1 < BottleNumber

  def serving
    "it"
  end

  def container
    "bottle"
  end
end

class BottleNumber6 < BottleNumber

  def quantity
    "1"
  end

  def container
    "six pack"
  end
end
