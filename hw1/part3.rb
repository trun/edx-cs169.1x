def combine_anagrams(words)
  keys = {}
  words.each do |word|
    key = word.downcase.chars.sort.join
    unless keys.key? key
      keys[key] = []
    end
    keys[key] << word
  end
  keys.values
end
