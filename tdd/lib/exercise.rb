class Array

  def my_uniq
    raise TypeError unless self.is_a?(Array)
    result = []
    self.each { |el| result << el}
    result.uniq
  end

  def two_sum
    i = 0
    result = []
    while i < self.length-1
      j = i + 1
      while j < self.length
        if self[i] + self[j] == 0
          result << [i, j]
        end
        j += 1
      end
      i += 1
    end
    result
  end

end

# matrix = 2D array
def my_transpose(matrix)
  raise ArgumentError unless matrix.is_a?(Array)
  matrix.transpose
end

def stock_picker(prices_per_day)
  return [] if prices_per_day.sort.reverse == prices_per_day

  i = 0
  result = []
  while i < prices_per_day.length-1
    j = i + 1
    while j < prices_per_day.length
      result << [prices_per_day[i], prices_per_day[j]]
      j += 1
    end
    i += 1
  end

  highest_pair = [0, 0]
  result.each do |pair|
    if highest_pair[1] - highest_pair[0] < pair[1] - pair[0]
      highest_pair = pair
    end
  end

  index_pair = []
  prices_per_day.each_with_index do |price, i|
    if price == highest_pair[0]
      index_pair << i
    elsif price == highest_pair[1] && index_pair.length == 1
      index_pair << i
      # index_pair[1] = i
    end
  end
  index_pair
end

class TowersOfHanoi
  attr_accessor :tower0, :tower1, :tower2

  def initialize
    @tower0 = [3, 2, 1]
    @tower1 = []
    @tower2 = []
  end

  def move(start_tow, end_tow)
    raise ArgumentError unless start_tow.is_a?(Array)
    raise ArgumentError unless end_tow.is_a?(Array)

    if is_valid_move?(start_tow, end_tow)
      end_tow.push(start_tow.pop)
    end
  end

  def won?
    return true if @tower1.length == 3 && @tower1.sort.reverse == @tower1
    return true if @tower2.length == 3 && @tower2.sort.reverse == @tower2
    false
  end

  private

  def is_valid_move?(start_tower, end_tower)
    return false if start_tower.empty?
    return false if !end_tower.empty? && start_tower[-1] > end_tower[-1]
    true
  end
end
