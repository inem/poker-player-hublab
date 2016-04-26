require_relative "game_state"
require_relative "pocket_odds"


class Player
  VERSION = "Bandy"

  def bet_request(game_state)
    begin
      game_state = GameState.new(game_state)
      pocket_odds = PocketOdds.new(game_state)
      odds = pocket_odds.percent_pre_flop

      call_amount = game_state.current_buy_in - game_state.my_bet

      puts "odds: #{odds}"
      expected_value = (odds * game_state.pot) - ((1-odds) * call_amount)
      puts "expected_value: #{expected_value}"

      if expected_value >= call_amount
        bet = expected_value.round
        puts "bet: #{expected_value}"
        bet
      else
        0
      end
    rescue
      puts "exception"
      0
    end
  end

  def showdown(game_state)

  end
end
