require 'spec_helper'


describe 'database' do
  it "creates a game with an array of players and a unique id" do
    game = RD::Database.db.create_game(["Bob", "Bill", "Bubba"])
    game2 = RD::Database.db.create_game(["Bob", "Bill", "Bubba"])
    expect(game.players).to eq(["Bob", "Bill", "Bubba"])
    expect(game2.id).to eq(game.id + 1)
  end

  it "creates a round" do
    round = RD::Database.db.create_round({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6], })
    round2 = RD::Database.db.create_round({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6], })

    expect(round.players).to eq(["Bob", "Bill", "Bubba"])
    expect(round.starting_scores).to eq([0,5,6])
    expect(round.id).to eq(round2.id -1)
  end
end
