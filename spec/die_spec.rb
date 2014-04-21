require 'spec_helper'

describe "die" do
  it "creates a dice with red, yellow, or green odds" do
    dice1 = RD::Die.new("green")
    dice2 = RD::Die.new("yellow")
    dice3 = RD::Die.new("green")
    expect(dice1.type).to eq("green")
    expect(dice2.type).to eq("yellow")
    expect(dice3.type).to eq("green")
  end
end
