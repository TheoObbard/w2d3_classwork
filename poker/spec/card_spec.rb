require 'card'

RSpec.describe Card do
  subject(:card) {Card.new("King", "Spades")}
  describe "#initialize" do
    it "has a value" do
      expect(card.value).to eq("King")
    end

    it "has a suit" do
      expect(card.suit).to eq("Spades")
    end
  end
end
