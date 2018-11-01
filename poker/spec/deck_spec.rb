require 'deck'

RSpec.describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "generates 52 distinct playing cards" do
      expect(deck.box).to eq(deck.box.uniq)
    end
  end

  describe "#shuffle_deck" do
    it "shuffles the deck" do
      old_box = deck.box
      deck.shuffle_deck
      expect(deck.box).to_not eq(old_box)
    end
  end

  describe "#distribute_cards" do
    let(:player) {double("Theo", hand: [])}

    it "distributes a card to the player" do
      expect(player.hand).to eq([])
      deck.distribute_cards(player)
      expect(player.hand.length).to eq(1)
      expect(deck.box.length).to eq(51)
    end
  end
end
