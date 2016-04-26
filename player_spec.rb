require_relative "player"

RSpec.describe Player do

  it "parses game_state successfully" do
    player = Player.new
    sample_game_state = {
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

    expect(player.hole_cards(sample_game_state)).to eql(["6", "6"])

    cards = player.hole_cards(sample_game_state)
    expect(player.pair_or_more?(cards)).to be_true

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