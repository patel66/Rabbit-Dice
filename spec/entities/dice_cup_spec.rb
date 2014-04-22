require 'spec_helper'

describe "DiceCup" do
  it "initializes with 13 dice" do
    dice_cup = RD::DiceCup.new
    expect(dice_cup.dice_in_cup.size).to eq(13)
    expect(dice_cup.dice_in_cup[0]).to be_a(RD::Die)
  end

  it "shuffles the dice" do
    dice_cup = RD::DiceCup.new
    old_dice_cup_array = dice_cup.dice_in_cup.dup
    dice_cup.shuffle
    expect(dice_cup.dice_in_cup.size).to eq(13)
    expect(dice_cup.dice_in_cup).to_not eq(old_dice_cup_array)
  end

  it "provides a certain number of die" do
    dice_cup = RD::DiceCup.new
    current_dice = dice_cup.get_dice(2)
    expect(current_dice.size).to eq(2)
    expect(current_dice[0]).to be_a(RD::Die)
    expect(current_dice.size).to eq(2)
    expect(dice_cup.dice_in_cup.size).to eq(11)
  end

end
