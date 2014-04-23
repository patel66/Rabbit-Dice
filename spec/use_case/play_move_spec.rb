require 'spec_helper'

describe 'play_move' do
  it "ends a player's move" do
    game = RD::Database.db.create_game({ players: ["Bob", "Bill", "Bubba"] })
    round = RD::Database.db.create_round({  })
  end

end
