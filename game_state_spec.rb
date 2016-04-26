require_relative "game_state"

RSpec.describe GameState do

  before(:each) do
    @expectation = [{"rank" => "6", "suit" => "hearts"}, {"rank" => "K", "suit" => "spades"}]
    sample_game_state = {
        "players" => [
            {
                "id" => 1,
                "name" => "HubLab",
                "hole_cards" => @expectation,
                "bet" => "100"
            },
            {
                "id" => 2,
                "name" => "Bob",
                "hole_cards" => [{"rank" => "7", "suit" => "hearts"}, {"rank" => "Q", "suit" => "spades"}]
            },
        ],
        "current_buy_in" => "1000"
    }
    @game_state = GameState.new(sample_game_state)
  end

  it "returns the current players' cards" do
    expect(@game_state.my_cards()).to eq @expectation
  end

  it "returns my bet" do
    expect(@game_state.my_bet()).to eq 100
  end

  it "returns the current buy in" do
    expect(@game_state.current_buy_in()).to eq 1000
  end
end