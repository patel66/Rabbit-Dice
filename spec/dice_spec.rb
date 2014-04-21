require 'spec_helper'


module RD
  it "creates a dice with red, yellow, or green odds" do
    dice = Dice.new("green")
    expect(dice.type).to eq("green")
  end
end


