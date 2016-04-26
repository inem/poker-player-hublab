require_relative "game_state"
require_relative "pocket_odds"


class Player
  VERSION = "Bandy"

  def bet_request(game_state)
    puts game_state
    begin
      game_state = GameState.new(game_state)
      pocket_odds = PocketOdds.new(game_state)
      odds = pocket_odds.percent_pre_flop

      call_amount = game_state.current_buy_in - game_state.my_bet
      expected_value = (odds * game_state.pot) - ((1-odds) * call_amount)

      bet = 0
      if expected_value >= call_amount
        bet = [expected_value.to_i, 0].max
      end

      puts "hole cards: #{game_state.my_cards}"
      puts "odds: #{odds}"
      puts "expected_value: #{expected_value}"
      puts "bet: #{bet}"

      if game_state.is_pre_flop
        bet *= 3
        bet
      else
        call_amount
      end
    rescue
      puts "exception"
      0
    end
  end

  def showdown(game_state)

  end
end
