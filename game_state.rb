
class GameState
  def initialize(state)
    @state = state
  end

  def my_cards
    our_player = nil
    @state["players"].each do |player|
      if player["name"] == "HubLab"
        our_player = player
      end
    end

    our_player["hole_cards"]
  end
end

