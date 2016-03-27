require 'set'

class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = Set.new(File.readlines(dictionary_file_name).map!(&:chomp))
    @current_words = []
    @all_seen_words = Hash.new
  end

  attr_reader :dictionary

  def adjacent_words(wort)
    @dictionary.select do |word|
      word.length == wort.length && one_off_words(word, wort)
    end
  end

  def one_off_words(word1,word2)
    total_diff = 0
    word1.chars.each_index do |index|
      total_diff += 1 unless word1[index] == word2[index]
    end
    total_diff == 1
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |word|
      adjacent_words(word).each do |adj_word|
        unless @all_seen_words.include?(adj_word)
          @all_seen_words[adj_word] = word
          new_current_words << adj_word
        end
      end
    end
    new_current_words.each {|word| puts "#{word} came from #{@all_seen_words[word]}"}
    new_current_words
  end

  def run(source, target)
    @current_words = Set.new([source])
    @all_seen_words = {source => nil}
    until @current_words.empty? || @all_seen_words.include?(target)
      @current_words  = explore_current_words
      # puts new_current_words
    end
    build_path(target)
  end

  def build_path(target)
    path = [target]
    word = target
    until word.nil?
      word = @all_seen_words[word]
      path << word
    end
    path.pop
    path
  end
end


if __FILE__ == $PROGRAM_NAME
  a = WordChainer.new('dictionary.txt')
  p a.adjacent_words('cat')
end
