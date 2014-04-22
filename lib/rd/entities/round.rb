module RD
  class Round < Entity

    attr_accessor :current_player_id, :current_scores, :starting_scores, :players, :round_over

    def initialize(attrs)
      super(attrs)
      @current_player_id = 0
      @round_over = false
      @current_scores = starting_scores.dup
    end
  end
end

