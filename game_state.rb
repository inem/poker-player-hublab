
class GameState
  def my_cards(game_state)
    our_player = nil
    game_state["players"].each do |player|
      if player["name"] == "HubLab"
        our_player = player
      end
    end

    our_player["hole_cards"]
  end
end

