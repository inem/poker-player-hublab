
class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    our_player = nil
    game_state["players"].each do |player|
      if player["name"] == "HubLab"
        our_player = player
      end
    end

    # if our_player[:hole_cards][0][:rank]


    20000
  end

  def showdown(game_state)

  end
end
