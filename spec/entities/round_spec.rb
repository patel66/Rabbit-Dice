require 'spec_helper'

describe 'Round' do
  it "is initialized with player array, starting_score array, current_score array, current_player_id" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    expect(round.players).to eq(["Bob", "Bill", "Bubba"])
    expect(round.starting_scores).to eq([0,5,6])
    expect(round.current_player_id).to eq(0)
    expect(round.round_over).to eq(false)
    expect(round.current_scores).to eq([0,5,6])
  end

  it "plays an opening move" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    current_player_id = round.current_player_id
    result =  round.continue
    expect(!!result[:round_over]).to eq(result[:round_over])  #checking for Boolean
    expect(result[:pending_score]).to be_a(Fixnum)
    expect(result[:current_scores]).to be_an(Array)
    expect(result[:rolls].size).to eq(3)
  end

  it "says a round is over if its over" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    round.stop
    round.stop
    expect(round.round_over).to eq(false)
    round.stop
    expect(round.round_over).to eq(true)
  end
end
