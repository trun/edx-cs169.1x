require_relative "../part3"
require "test/unit"

class TestPart2 < Test::Unit::TestCase
  def test_combine_anagrams
    assert_equal [["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]], combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'])
  end
end