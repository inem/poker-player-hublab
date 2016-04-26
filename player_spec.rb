require_relative "player"

RSpec.describe Player do
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

  it "detects pairs correctly" do
    expect(player.hole_cards(sample_game_state)).to eql(["6", "6"])


    cards = player.hole_cards(sample_game_state)
    expect(player.pair_or_more?(cards)).to be true

    cards = player.hole_cards(sample_game_state2)
    expect(player.pair_or_more?(cards)).to be false
  end

  it "detects pairs correctly" do
    player = Player.new
    expect(player.bet_request(sample_game_state)).not_to eql(0)
  end
end