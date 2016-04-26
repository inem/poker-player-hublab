require_relative "pocket_odds"

RSpec.describe PocketOdds do
  it "returns 0.85 for our pair vs. 2 undercards" do
    pocket_odds_calculator = PocketOdds.new

    pair = [{"rank" => "6", "suit" => "hearts"}, {"rank" => "6", "suit" => "spades"}]
    two_undercards = [{"rank" => "5", "suit" => "hearts"}, {"rank" => "4", "suit" => "spades"}]

    sample_game_state = {
        "players" => [
            {
                "id" => 1,
                "name" => "HubLab",
                "hole_cards" => pair
            },
            {
                "id" => 2,
                "name" => "Bob",
                "hole_cards" => two_undercards
            }
        ]
    }

    expect(pocket_odds_calculator.percent_pre_flop(sample_game_state)).to eq 0.85
  end
end