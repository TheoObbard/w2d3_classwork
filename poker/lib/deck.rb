require_relative "card"

class Deck
  attr_reader :box

  SUITS = ["clubs", "diamonds", "hearts", "spades"]
  VALUES = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]

  def initialize
    @box = create_deck
  end

  def shuffle_deck
    @box = @box.shuffle
  end

  def distribute_cards(player)
    player.hand << @box.pop
  end

  private

  def create_deck
    result = []
    VALUES.each do |value|
      SUITS.each do |suit|
        result << Card.new(value, suit)
      end
    end
    result
  end

end
