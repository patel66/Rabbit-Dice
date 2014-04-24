require 'spec_helper'


describe 'database' do
  it "creates a game with an array of players and a unique id" do
    game = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    game2 = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    expect(game.players).to eq(["Bob", "Bill", "Bubba"])
    expect(game2.id).to eq(game.id + 1)
  end

  it "creates a round" do
    game = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })

    round = RD::Database.db.create_round({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6], game_id: game.id })
    round2 = RD::Database.db.create_round({ players: ["Bob", "Bill", "Bubba"], starting_scores: [0,5,6], game_id: game.id })

    expect(round.players).to eq(["Bob", "Bill", "Bubba"])
    expect(round.starting_scores).to eq([0,5,6])
    expect(round2.id).to eq(round.id + 1)
  end

  it 'can get the game' do
    g1 = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    g2 = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
  
    game= RD::Database.db.get_game(g1.id)
    game2= RD::Database.db.get_game(g2.id)



    expect(game.id).to eq(g1.id) 
    expect(game2.id).to eq(g2.id) 
  end 
end
