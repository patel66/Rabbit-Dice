module RD
  class Round < Entity

    attr_accessor :current_player_id, :current_scores, :starting_scores, :players, :round_over

    def initialize(attrs)
      super(attrs)
      @current_player_id = 0
      @current_scores = starting_scores.dup
      @pending_score = 0
      @round_over = false
    end

    def continue

    end

    def stop
      @current_scores[@current_player_id] += @pending_score
      @pending_score = 0
      @current_player_id += 1

      if (@current_player_id == @players.size) || (@current_scores[(@current_player_id - 1)] >= 13)
        @round_over = true
      end
    end
  end
end

