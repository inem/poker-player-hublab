require_relative "game_state"


class Player
  VERSION = "Mandy"

  def bet_request(game_state)
    begin
      odds = PocketOdds.new(GameState.new(game_state))
      rand(1700)+700 * (1 + odds)
    rescue
      puts "exception"
      rand(1700)+700
    end
  end

  def showdown(game_state)

  end

  def pair_or_more?(cards)
    cards.uniq.size < cards.size
  end

  def hole_cards(game_state)
    player = our_player(game_state)
    Array(player["hole_cards"].map{|card| card["rank"]})
  end

  def our_player(game_state)
    game_state["players"].each do |player|
      return player if player["name"] == "HubLab"
    end
  end
end
