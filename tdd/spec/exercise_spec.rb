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
