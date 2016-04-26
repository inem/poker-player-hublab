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
                    },
                ],
                  "bet" => "0"

              },
              {
                  "id" => 2,
                  "name" => "Bob"
              }
          ],
          "community_cards" => [
            {
                "rank" => "4",
                "suit" => "spades"
              },
            {
                  "rank" => "A",
              "suit" => "hearts"
          },
              {
                  "rank" => "6",
              "suit" => "clubs"
          }
          ],

          "minimum_raise" => "50",
          "pot" => "100",
          "current_buy_in" => "10"
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
                        "rank" => "6",
                        "suit" => "hearts"
                    },
                    {
                        "rank" => "6",
                        "suit" => "spades"
                    },
                ],
                "my_bet" => "0"

            },
            {
                "id" => 2,
                "name" => "Bob"
            }
        ],
        "community_cards" => [
            {
                "rank" => "4",
                "suit" => "spades"
            },
            {
                "rank" => "A",
                "suit" => "hearts"
            },
            {
                "rank" => "6",
                "suit" => "clubs"
            }
        ],

        "pot" => "100",
        "minimum_raise" => "100",
        "current_buy_in" => "10"
    }

  }

  it "should bet high if there's no buy-in" do
    expect(player.bet_request(sample_game_state)).to be_within(0.1).of(10)
  end

  it "should bet less high if there is a buy-in" do
    expect(player.bet_request(sample_game_state2)).to be_within(0.1).of(10)
  end

end
