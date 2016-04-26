require_relative "game_state"


class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    begin
      if pair_or_more?(our_player(game_state))
        20000
        puts "pair_or_more"
      else
        500
        puts "else"
      end
    rescue
      rand(2000)+100
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


