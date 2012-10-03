def palindrome?(str)
  str = str.gsub(/[^\w]/, '').downcase!
  str == str.reverse
end

def count_words(str)
  count = {}
  count.default = 0
  str = str.gsub(/[^\w ]/, '').downcase!
  str.split(/\s+/).each { |s| count[s] += 1 }
  count
end
