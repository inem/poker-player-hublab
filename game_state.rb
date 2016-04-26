
class GameState

  attr_reader :cards

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

  def my_stack
    our_player = my_player
    our_player["stack"].to_i
  end

  def current_buy_in
    @state["current_buy_in"].to_i
  end

  def pot
    @state["pot"].to_i
  end

  def minimum_raise
    @state["minimum_raise"].to_i
  end

  def is_pre_flop
    @state["community_cards"].empty?
  end

end

