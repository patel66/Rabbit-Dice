require 'spec_helper'

describe 'play_move' do
  it "ends a player's move on stop" do
    game = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    round = RD::Database.db.create_round({players: game.players, starting_scores: game.scores, game_id: game.id })

    result = RD::PlayMove.run({ game_id: game.id, move: "stop" })
    expect(result.success?).to eq(true)
    expect(result.game_over).to eq(false)
  end

  it " continue player's turn on continue " do
    game = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    round = RD::Database.db.create_round({players: game.players, starting_scores: game.scores, game_id: game.id })
    
    RD::Die.any_instance.stub(:roll).and_return("captured")
    result = RD::PlayMove.run({ game_id: game.id, move: "continue" })
    RD::PlayMove.run({ game_id: game.id, move: "continue" })
    expect(round.pending_score).to eq(6)
    

    expect(result.success?).to eq(true)
    expect(result.game_over).to eq(false)







  end

end
