require 'rspec'
require 'spec_helper'
require 'exercise'

RSpec.describe Array do
  describe "#my_uniq" do

    it "return a new array" do
      old = [1,2,3]
      new = [1,2,3].my_uniq

      expect(old).to_not be(new)
    end

    it "removes duplicates" do
      old = [1,2,2,3,5,5]
      expect(old.my_uniq).to eq([1,2,3,5])
    end
  end

  describe "#two_sum" do
    it "returns the correct pairs" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns pairs in the correct order" do
      expect([-3, 2, 0, 1, 3, -1, -2, -1].two_sum).to eq([[0,4], [1, 6], [3, 5], [3, 7]])
    end
  end

end

RSpec.describe do
  describe "#my_transpose" do
    # it "takes an array" do
    #   expect{my_transpose([])}.to_not raise_error(ArgumentError)
    # end

    it "returns an array" do
      expect(my_transpose([])).to eq([])
    end

    it "transposes the given matrix" do
      expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    it "takes an array of prices each day" do
      expect{stock_picker([1, 2, "three"])}.to raise_error(ArgumentError)
    end

    it "outputs the most profitable pair of days" do
      expect(stock_picker([10, 30, 50, 70, 5, 40])).to eq([0, 3])
    end

    it "returns no pair if you can't make a profit" do
      expect(stock_picker([6, 5, 4, 3, 2, 1])).to eq([])
    end
  end
end

RSpec.describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new}

  describe "#initialize" do
    it "contains three towers" do
      expect(game.tower0).to eq([3, 2, 1])
      expect(game.tower1).to eq([])
      expect(game.tower2).to eq([])
    end

    it "starts the discs on tower 0" do
      expect(game.tower0).to eq([3, 2, 1])
    end

  end

  describe "#move" do
    it "takes 0, 1, or 2 as input" do
      expect{game.move("start", game.tower2)}.to raise_error(ArgumentError)
      expect{game.move(5, game.tower0)}.to raise_error(ArgumentError)
    end

    it "performs the move if it's valid" do
      game.move(game.tower0, game.tower2)
      expect(game.tower0).to eq([3, 2])
      expect(game.tower1).to eq([])
      expect(game.tower2).to eq([1])
    end
  end

  describe "#won?" do
    it "returns true if the game is won" do
      game.tower0 = []
      game.tower1 = []
      game.tower2 = [3, 2, 1]
      expect(game).to be_won #maybe will fail
    end

    it "returns false if not" do
      expect(game).to_not be_won
    end
  end
end
