require 'pry-debugger'

module RD
  class DiceCup

    attr_reader :dice_in_cup, :dice_in_play

    def initialize
      @dice_in_cup = []
      6.times { @dice_in_cup.push(Die.new("green")) }
      4.times { @dice_in_cup.push(Die.new("yellow")) }
      3.times { @dice_in_cup.push(Die.new("red")) }

      @dice_in_play = []
    end

    def shuffle
      @dice_in_cup.shuffle!
    end

    def get_dice(number)
      self.shuffle
      popped_dice = []
      number.times do
        popped_die = @dice_in_cup.pop()
        @dice_in_play << popped_die
        popped_dice << popped_die
      end
      return popped_dice
    end

  end
end
