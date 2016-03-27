class Array

  def subsets
    return [[]] if self.empty?
    results = []
    self.each{|el| results += (self - [el]).subsets}
    results << self
    results.uniq
  end

end

if __FILE__ == $PROGRAM_NAME
  p [].subsets # => [[]]
  p [1].subsets # => [[], [1]]
  p [1, 2].subsets # => [[], [1], [2], [1, 2]]
  p [1, 2, 3].subsets
end

#TODO rewrite
