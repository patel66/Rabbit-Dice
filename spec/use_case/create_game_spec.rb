require 'spec_helper'

describe "CreateGame" do

  it "Creates a Game with the players array it is passed" do
    result = RD::CreateGame.run(["Tom", "Jerry"])
    expect(result.success?).to eq(true)
    expect(result.game.players).to eq(["Tom", "Jerry"])
  end
end
