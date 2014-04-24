require 'spec_helper'
require 'pry-debugger'

describe "Game" do
	it "is initialized with player_names array, empty_score array, empty rounds array" do
		game = RD::Game.new({ players: ["Bob", "Bill", "Bubba"] })
		expect(game.players).to eq(["Bob", "Bill", "Bubba"])
		expect(game.scores).to eq([0,0,0])
		expect(game.rounds).to eq([])
	end

  it "adds a round" do
    game = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    round = RD::Database.db.create_round({ players: game.players, starting_scores: game.scores, game_id: game.id })
    expect(game.rounds.size).to eq(1)
    expect(game.rounds[0].id).to eq(round.id)
  end

  it "gets the current round" do
    game = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    round = RD::Database.db.create_round({ players: game.players, starting_scores: game.scores , game_id: game.id })
    binding.pry
    expect(game.current_round.id).to eq(round.id)
  end

  it "returns game_over? = true if game is over" do

  end

  it "returns the proper winner" do
  end

  it "returns the proper winner name"
  end

end
