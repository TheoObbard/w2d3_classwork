require 'player'
require 'byebug'

RSpec.describe Player do
  subject(:player) {Player.new("Theo", 1000000)}

  describe "#initialize" do
    it "has a name" do
      expect(player.name).to eq("Theo")
    end

    it "starts with an empty hand" do
      expect(player.hand).to eq([])
    end

    it "starts with a pot of money" do
      expect(player.pot).to eq(1000000)
    end
  end

  describe "#discard" do
    let(:hand) {[1,2,3,4,5]}
    it "discards a card" do
      player.hand = hand
      player.discard(2)
      expect(player.hand).to eq([1, 3, 4, 5])
    end

    it "discards multiple cards" do
      player.hand = hand
      player.discard(1, 3, 4)
      expect(player.hand).to eq([2, 5])
    end
  end

  describe "#fold" do
    let(:hand) {[1,2,3,4,5]}
    let(:game) {double(players: [])}

    it "folds a hand" do
      player.hand = [1, 2, 3, 4, 5]
      player.fold
      expect(player.hand).to eq([])
    end

    it "removes them from the game" do
      game.players << player
      player.fold
      expect(game.players).to_not include(player)
    end
  end

  describe "#raise" do
    let(:game) {double(players: [player], pot: 100)}
    it "adds to the game pot" do
      player.raise(500)
      expect(game.pot).to eq(600)
    end

    it "checks to see if player has valid funds" do
      expect{player.raise(50000000000)}.to raise_error("Not enough funds to raise")
    end

  end

end
