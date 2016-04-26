require_relative "player"

RSpec.describe Player do
  it "parses game_state successfully" do
    player = Player.new
    sample_game_state = {
      "players" => [
          {
              "id" => 1,
              "name" => "Alice"
          },
          {
              "id" => 2,
              "name" => "Bob"
          }
      ]
    }

    expect(player.bet_request(sample_game_state)).to equal 20000
  end
end