require 'spec_helper'


module RD
  it "creates a dice with red, yellow, or green odds" do
    dice1 = Dice.new("green")
    dice2 = Dice.new("yellow")
    dice3 = Dice.new("green")
    expect(dice1.type).to eq("green")
    expect(dice2.type).to eq("yellow")
    expect(dice3.type).to eq("green")
  end
end


