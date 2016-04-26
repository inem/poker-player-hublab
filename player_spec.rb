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


  it "should use pocket calculator to place bets" do
    game_state = GameState.new(sample_game_state)
    pocket_odds_calculator = PocketOdds.new(game_state)
    expect(player.bet_request(sample_game_state)).to equal 435

  end

  # it "detects pairs correctly" do
  #   player = Player.new

  #   hole_cards = [
  #               {
  #                   rank: "6",
  #                   suit: "hearts"
  #               },
  #               {
  #                   rank: "6",
  #                   suit: "spades"
  #               }
  #           ]

  #   sample_game_state = {
  #     "players" => [
  #         {
  #             "id" => 1,
  #             "name" => "Alice"
  #         },
  #         {
  #             "id" => 2,
  #             "name" => "Bob"
  #         }
  #     ]
  #   }

  #   expect(player(sample_game_state).pair_or_more?(hole_cards)).to be_true
  # end
end
