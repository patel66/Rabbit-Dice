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

  it "plays an opening move with all 'captured'" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    RD::Die.any_instance.stub(:roll).and_return("captured")
    current_player_id = round.current_player_id
    result =  round.continue
    expect(result[:round_over]).to eq(false)
    expect(result[:pending_score]).to eq(3)
    expect(result[:current_scores]).to eq([0,5,6])
    expect(result[:rolls]).to eq(["captured", "captured", "captured"])
  end

  it "plays an opening move with all 'dodge'" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    RD::Die.any_instance.stub(:roll).and_return("captured")
    current_player_id = round.current_player_id
    result =  round.continue
    expect(result[:round_over]).to eq(false)
    expect(result[:pending_score]).to eq(3)
    expect(result[:current_scores]).to eq([0,5,6])
    expect(result[:rolls]).to eq(["captured", "captured", "captured"])
  end

  it "plays an opening move with all 'shots'" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    RD::Die.any_instance.stub(:roll).and_return("captured")
    current_player_id = round.current_player_id
    result =  round.continue
    expect(result[:round_over]).to eq(false)
    expect(result[:pending_score]).to eq(3)
    expect(result[:current_scores]).to eq([0,5,6])
    expect(result[:rolls]).to eq(["captured", "captured", "captured"])
  end



  it "says a round is over if its over" do
    round = RD::Round.new({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6] })
    round.stop
    round.stop
    expect(round.round_over).to eq(false)
    round.stop
    expect(round.round_over).to eq(true)
  end

  #Time.stub(:now).and_return(Time.new(2014,month=1,day=1,hour=15,min=30))

end
