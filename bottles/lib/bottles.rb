class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.factory(number)
    
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" + 
    "#{bottle_number.action}, " +
    "#{bottle_number.next_number} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def self.factory(number)
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

  def next_number
    BottleNumber.factory(number-1)
  end

  def action
    "Take #{a_serving} down and pass it around"
  end

  def a_serving
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

  def next_number
    BottleNumber.factory(99)
  end

  def action
    "Go to the store and buy some more"
  end
end

class BottleNumber1 < BottleNumber

  def a_serving
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
