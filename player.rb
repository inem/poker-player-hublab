
class Player

  VERSION = "InFlabWorksHub"

  def bet_request(game_state)
    our_player = nil
    game_state[:players].each do |player|
      if player[:name] == "HubLab"
        our_player = player
      end
    end

    20000
  end

  def showdown(game_state)

  end
end
