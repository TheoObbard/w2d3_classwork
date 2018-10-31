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
