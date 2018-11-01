require 'game'

class Player

  attr_accessor :name, :pot, :hand

  def initialize(name, pot)
    @name = name
    @hand = []
    @pot = pot
  end

  def discard(*cards)
    cards.each do |card|
      @hand.delete(card)
    end
    @hand
  end

  def fold
    @hand = []
    # game.players.delete(self)
  end
end
