require_relative "player"
require_relative "pocket_odds"

RSpec.describe Player do
  before :each do
    srand(1000)
  end
  let(:player) { Player.new }
  let(:sample_game_state){
    {
          "players" => [
              {
                  "id" => 1,
                  "name" => "HubLab",
                  "hole_cards" => [

                    {
                        "rank" => "6",
                        "suit" => "hearts"
                    },
                    {
                        "rank" => "6",
                        "suit" => "spades"
                    }
                ]

              },
              {
                  "id" => 2,
                  "name" => "Bob"
              }
          ]
        }

  }

  let(:sample_game_state2){
    {
          "players" => [
              {
                  "id" => 1,
                  "name" => "HubLab",
                  "hole_cards" => [

                    {
                        "rank" => "7",
                        "suit" => "hearts"
                    },
                    {
                        "rank" => "6",
                        "suit" => "spades"
                    }
                ]

              },
              {
                  "id" => 2,
                  "name" => "Bob"
              }
          ]
        }

  }

  it "should use pocket calculator to place bets" do
    game_state = GameState.new(sample_game_state)
    expect(player.bet_request(sample_game_state)).to be_within(0.1).of(2600)

  end
end
