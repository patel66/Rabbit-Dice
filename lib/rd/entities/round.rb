module RD
  class Round < Entity

    attr_accessor :current_player_id, :current_scores, :starting_scores, :players, :round_over

    def initialize(attrs)
      super(attrs)
      @current_player_id = 0
      @current_scores = starting_scores.dup
      @pending_score = 0
      @pending_shots = 0
      @round_over = false
      @dice_holder = []
      @roll_history = {}
      @dice_cup = RD::DiceCup.new

    end

    def continue
      # fill the dice holder
      @dice_holder.concat(@dice_cup.get_dice(3 - @dice_holder.size))


      dice_rolls = @dice_holder.map { |die| die.roll }

      dice_rolls.reverse.each_with_index do |roll, index|
        case roll
        when "captured"
          @pending_score += 1
          @dice_holder.delete_at(index)
        when "shot"
          @pending_shots += 1
          @dice_holder.delete_at(index)
        end
      end

      if @pending_shots >= 3
        @pending_score = 0
        self.stop
      end

      if @roll_history[@current_player_id] == nil
        @roll_history[@current_player_id] = []
      end

      @roll_history[@current_player_id] << dice_rolls

      return { round_over: @round_over, pending_score: @pending_score,
                current_scores: @current_scores, rolls: dice_rolls,
                 current_player_id: @current_player_id }
    end


    def stop
      @current_scores[@current_player_id] += @pending_score
      @pending_score = 0
      @current_player_id += 1

      if (@current_player_id == @players.size) || (@current_scores[(@current_player_id - 1)] >= 13)
        @round_over = true
      end

      return { round_over: @round_over, current_scores: @current_scores,
              current_player_id: current_player_id }

    end
  end
end

