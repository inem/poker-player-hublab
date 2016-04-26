class PocketOdds
<<<<<<< 190357c06f7fa0cd3b15f3d714c5d879828d5db7
  attr_reader :cards

  def initialize(game_state)
    @cards = game_state.my_cards
  end

  def percent_pre_flop
    if cards[0]['rank'] == 'A' && cards[1]['rank'] == 'A'
      0.85
    elsif cards[0]['rank'] == 'K' && cards[1]['rank'] == 'K'
      0.82
    else
      0
    end
  end

  def pair?

  end
end

# [{"rank" => "6", "suit" => "hearts"}, {"rank" => "K", "suit" => "spades"}]
