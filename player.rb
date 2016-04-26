
class Player

  VERSION = "InFlabWorksHub"

  def bet_request(game_state)
    player = get_player(game_state)

    if pair_or_more?(player)
      20000
    else
      500
    end
  end

  def showdown(game_state)

  end

  def pair_or_more?(cards)
    cards.size.uniq < cards.size
  end

  def hole_cards(player)
    player["hole_cards"].map{|card| card["rank"]}
  end

  def player(game_state)
    game_state[:players].each do |player|
      return player if player[:name] == "HubLab"
    end
  end
end


