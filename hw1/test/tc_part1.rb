require_relative "../part1"
require "test/unit"

class TestPart1 < Test::Unit::TestCase
  def test_palindrome
    assert palindrome? "A man, a plan, a canal -- Panama"
    assert palindrome? "Madam, I'm Adam!"
    assert !(palindrome? "Abracadabra")
  end

  def test_count_words
    assert_block do
      {
          'a' => 3,
          'man' => 1,
          'canal' => 1,
          'panama' => 1,
          'plan' => 1
      }.eql?(count_words "A man, a plan, a canal -- Panama")
    end
    assert_block do
      {
          'doo' => 3,
          'bee' => 2
      }.eql?(count_words "Doo bee doo bee doo")
    end
    assert_block do
      {
          'what' => 3,
          'the' => 2
      }.eql?(count_words "what the what the what")
    end
  end
end