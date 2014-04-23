require 'spec_helper'

describe "Game" do
	it "is initialized with player_names array, empty_score array, empty rounds array" do
		game = RD::Game.new({ players: ["Bob", "Bill", "Bubba"] })
		expect(game.players).to eq(["Bob", "Bill", "Bubba"])
		expect(game.scores).to eq([0,0,0])
		expect(game.rounds).to eq([])
	end
end
