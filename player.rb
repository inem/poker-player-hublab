require_relative "game_state"


class Player
  VERSION = "Mandy"

  def bet_request(game_state)
    begin

        cards = hole_cards(game_state)
        if pair_or_more?(cards)
          puts "500"
          rand(1700)+700
        else
          puts "0"
          150
        end

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


