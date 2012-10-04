class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  m1 = m1.downcase
  m2 = m2.downcase
  case m1
    when 'p'
      case m2
        when 'r', 'p'
          return true
        when 's'
          return false
      end
    when 'r'
      case m2
        when 's', 'r'
          return true
        when 'p'
          return false
      end
    when 's'
      case m2
        when 'p', 's'
          return true
        when 'r'
          return false
      end
  end
  raise NoSuchStrategyError
end

def rps_game_winner(game)
  if game.length != 2
    raise WrongNumberOfPlayersError
  end

  name1, strat1 = game.first
  name2, strat2 = game.last

  if rps_result strat1, strat2
    [name1, strat1]
  else
    [name2, strat2]
  end
end

def rps_tournament_winner(tournament)
  if tournament.first.first.is_a? Array
    rps_game_winner(tournament.map do |game|
      rps_tournament_winner game
    end)
  else
    rps_game_winner tournament
  end
end
