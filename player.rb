require_relative "game_state"
require_relative "pocket_odds"


class Player
  VERSION = "Mandy"

  def bet_request(game_state)
    game_state = GameState.new(game_state)
    pocket_odds = PocketOdds.new(game_state)
    odds = pocket_odds.percent_pre_flop
    return rand(1700)+700 * (1 + odds)
  end

  def showdown(game_state)

  end
end
