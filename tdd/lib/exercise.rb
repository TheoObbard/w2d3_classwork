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
