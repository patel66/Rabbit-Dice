require 'spec_helper'

describe 'Round' do
  it "is initialized with player array, starting_score array, current_score array, current_player_id" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    expect(round.players).to eq(["Bob", "Bill", "Bubba"])
    expect(round.starting_scores).to eq([0,5,6])
    expect(round.current_player_id).to eq(0)
    expect(round.round_over?).to eq(false)
    expect(round.current_scores).to eq([0,5,6])
  end

  it "plays an opening move" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    current_player_id = round.current_player_id
    RD::Round.continue

    expect().to eq()
  end

  it "says a round is over if its fucking over" do

  end

end
