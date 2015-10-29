class House
  DATA = [
    'the horse and the hound and the horn that belonged to',
    'the farmer sowing his corn that kept',
    'the rooster that crowed in the morn that woke',
    'the priest all shaven and shorn that married',
    'the man all tattered and torn that kissed',
    'the maiden all forlorn that milked',
    'the cow with the crumpled horn that tossed',
    'the dog that worried',
    'the cat that killed',
    'the rat that ate',
    'the malt that lay in',
    'the house that Jack built']

  attr_reader :data
  attr_reader :formater

  def initialize(orderer: DefaultOrder.new, formater: DefaultFormater.new)
  # def initialize(orderer: DefaultOrder.new, formater: EchoFormater.new)
  # def initialize(orderer: ShuffleOrder.new, formater: DefaultFormater.new)
  # def initialize(orderer: ShuffleOrder.new, formater: EchoFormater.new)
  # def initialize(orderer: BangShuffleOrder.new, formater: DefaultFormater.new)
    @data = orderer.order(DATA)
    @formater = formater
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def line(num)
    "This is #{phrase(num)}.\n"
  end

  def phrase(num)
    part(num).join(' ')
  end

  def part(num)
    formater.format(data,num)
  end
end


class ShuffleOrder
  def order(data)
    data.shuffle
  end
end

class DefaultOrder
  def order(data)
    data
  end
end

class BangShuffleOrder
  def order(data)
    data[0..-1].shuffle.push(data.last)
  end
end

class DefaultFormater
  def format(data,num)
    data.last(num)
  end
end

class EchoFormater
  def format(data,num)
    data.last(num).zip(data.last(num))
  end
end

