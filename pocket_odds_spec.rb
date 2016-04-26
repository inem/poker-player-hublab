require_relative "pocket_odds"

RSpec.describe PocketOdds do
  subject { described_class.new(game_state) }

  let(:game_state) { double(:game_state, my_cards: cards ) }
  let(:cards) { [{"rank" => "A", "suit" => "hearts"}, {"rank" => "A", "suit" => "spades"}] }

  it "returns 0.85 for our pair vs. 2 undercards" do
    expect(subject.percent_pre_flop).to eq 0.85
  end

  context 'shitty cards' do
    let(:cards) { [{"rank" => "2", "suit" => "hearts"}, {"rank" => "7", "suit" => "spades"}] }
    it 'should give a value for a pair of kings' do
      expect(subject.percent_pre_flop).to eq 0
    end
  end

  context 'pair of kings' do
    let(:cards) { [{"rank" => "K", "suit" => "hearts"}, {"rank" => "K", "suit" => "spades"}] }
    it 'should give a value for a pair of kings' do
      expect(subject.percent_pre_flop).to eq 0.82
    end
  end

  context 'pair of queens' do
    let(:cards) { [{"rank" => "Q", "suit" => "hearts"}, {"rank" => "Q", "suit" => "spades"}] }
    it 'should give a value for a pair of kings' do
      expect(subject.percent_pre_flop).to eq 0.80
    end
  end

  it "returns 0.82 for our pair vs. lower pair" do
    pocket_odds_calculator = PocketOdds.new

    pair = [{"rank" => "6", "suit" => "hearts"}, {"rank" => "6", "suit" => "spades"}]
    lower_pair = [{"rank" => "5", "suit" => "hearts"}, {"rank" => "5", "suit" => "spades"}]

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
                "hole_cards" => lower_pair
            }
        ]
    }

    expect(pocket_odds_calculator.percent_pre_flop(sample_game_state)).to eq 0.82
  end
end
