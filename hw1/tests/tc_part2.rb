require_relative "../part2"
require "test/unit"

class TestPart2 < Test::Unit::TestCase
  def setup
    @game1 = [ ['Alice', 'R'], ['Bob', 'S'] ]
    @game2 = [ ['Alice', 'P'], ['Bob', 'R'] ]
    @game3 = [ ['Alice', 'R'], ['Bob', 'P'] ]
    @game_tie = [ ['Alice', 'R'], ['Bob', 'R'] ]
    @tournament = [
        [
            [ ["Armando", "P"], ["Dave", "S"] ],
            [ ["Richard", "R"],  ["Michael", "S"] ],
        ],
        [
            [ ["Allen", "S"], ["Omer", "P"] ],
            [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
    ]
  end

  def test_rps_result
    assert rps_result('p', 'p')
    assert rps_result('p', 'r')
    assert !rps_result('p', 's')
    assert rps_result('r', 'r')
    assert rps_result('r', 's')
    assert !rps_result('r', 'p')
    assert rps_result('s', 's')
    assert rps_result('s', 'p')
    assert !rps_result('s', 'r')
  end

  def test_rps_game_winner
    assert_equal ['Alice', 'R'], rps_game_winner(@game1)
    assert_equal ['Alice', 'P'], rps_game_winner(@game2)
    assert_equal ['Bob', 'P'], rps_game_winner(@game3)
    assert_equal ['Alice', 'R'], rps_game_winner(@game_tie)
  end

  def test_rps_game_winner_right_strategy
    assert_nothing_raised do
      rps_game_winner [ ['Alice', 'S'], ['Bob', 'R'] ]
      rps_game_winner [ ['Alice', 'P'], ['Bob', 'R'] ]
      rps_game_winner [ ['Alice', 's'], ['Bob', 'r'] ]
      rps_game_winner [ ['Alice', 'p'], ['Bob', 'r'] ]
    end
  end

  def test_rps_game_winner_wrong_strategy
    assert_raise NoSuchStrategyError do
      rps_game_winner [ ['Alice', 'F'], ['Bob', 'S'] ]
    end
    assert_raise NoSuchStrategyError do
      rps_game_winner [ ['Alice', 'S'], ['Bob', 'F'] ]
    end
  end

  def test_rps_game_winner_too_few_players
    assert_raise WrongNumberOfPlayersError do
      rps_game_winner [ ['Alice', 'P'] ]
    end
  end

  def test_rps_game_winner_too_many_players
    assert_raise WrongNumberOfPlayersError do
      rps_game_winner [ ['Alice', 'P'], ['Bob', 'S'], ['Eve', 'R'] ]
    end
  end

  def test_rps_tournament_winner
    assert_equal ['Richard', 'R'], rps_tournament_winner(@tournament)
  end

  def test_rps_tournament_winner_single
    assert_equal ['Alice', 'R'], rps_tournament_winner(@game1)
  end
end