require_relative "game_state"

RSpec.describe GameState do
  it "returns the current players' cards" do
    game_state = GameState.new
    expectation = [{"rank" => "6", "suit" => "hearts"}, {"rank" => "K", "suit" => "spades"}]
    sample_game_state = {
        "players" => [
            {
                "id" => 1,
                "name" => "HubLab",
                "hole_cards" => expectation
            },
            {
                "id" => 2,
                "name" => "Bob",
                "hole_cards" => [{"rank" => "7", "suit" => "hearts"}, {"rank" => "Q", "suit" => "spades"}]
            }
        ]
    }

    expect(game_state.my_cards(sample_game_state)).to eq expectation
  end
end