
class GameState
  def initialize(state)
    @state = state
  end

  def my_player
    our_player = nil
    @state["players"].each do |player|
      if player["name"] == "HubLab"
        our_player = player
      end
    end
    our_player
  end

  def my_cards
    our_player = my_player
    our_player["hole_cards"]
  end

  def my_bet
    our_player = my_player
    our_player["bet"].to_i
  end

  def current_buy_in
    @state["current_buy_in"].to_i
  end
end

