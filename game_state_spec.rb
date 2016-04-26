require_relative "game_state"

RSpec.describe GameState do
  it "returns the current players' cards" do
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

    game_state = GameState.new(sample_game_state)

    expect(game_state.my_cards()).to eq expectation
  end
end