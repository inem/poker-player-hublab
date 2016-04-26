class PocketOdds

  attr_reader :cards

  DEFAULT_VALUE = 0.0

  def initialize(game_state)
    @cards = game_state.my_cards
  end

  def percent_pre_flop
    if pair?
      rank = cards[0]['rank']
      pair_map = {
          'A' => 0.85,
          'K' => 0.82,
          'Q' => 0.8,
          'J' => 0.78,
          '10' => 0.75,
          '9' => 0.72,
          '8' => 0.67,
          '7' => 0.66,
          '6' => 0.63
      }

      pair_map[rank] || DEFAULT_VALUE
    elsif suited?
      card_map = {
          'AK' => 0.67,
          'AQ' => 0.66,
          'AJ' => 0.65,
          '10A' => 0.65,
          'KQ' => 0.63
      }
      card_map[rank_string] || DEFAULT_VALUE
    else
      card_map = {
          'AK' => 0.65,
          'AQ' => 0.65,
          'AJ' => 0.64,
          '10A' => 0.63
      }
      card_map[rank_string] || DEFAULT_VALUE
    end
  end

  private

  def suited?
    cards[0]['suit'] == cards[1]['suit']
  end

  def pair?
    cards[0]['rank'] == cards[1]['rank']
  end

  def rank_string
    cards.map { |c| c['rank'] }.sort.join('')
  end
end


__END__

[{"rank" => "6", "suit" => "hearts"}, {"rank" => "K", "suit" => "spades"}]
