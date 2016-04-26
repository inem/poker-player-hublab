class PocketOdds

  attr_reader :cards

  def initialize(game_state)
    @cards = game_state.my_cards
  end

  def percent_pre_flop
    if pair?
      rank = cards[0]['rank']
      pair_map = {
          'A' =>  0.85,
          'K' => 0.82,
          'Q' => 0.8,
          'J' => 0.78,
          '10'=> 0.75,
          '9'=> 0.72,
          '8'=> 0.67,
          '7'=> 0.66,
          '6'=> 0.63
      }

      pair_map[rank] || 0
    else
      0
    end
  end

  def pair?
    cards[0]['rank'] == cards[1]['rank']
  end
end


__END__

[{"rank" => "6", "suit" => "hearts"}, {"rank" => "K", "suit" => "spades"}]
