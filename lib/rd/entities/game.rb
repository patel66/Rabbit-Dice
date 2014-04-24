module RD
	class Game
		attr_accessor :players, :scores, :rounds, :id
		def initialize(attrs)
			@players = attrs[:players]
      @id = attrs[:id]
			@scores = Array.new(@players.length){0}
			@rounds = []
		end

    def add_round(round)
      @rounds << round
    end

    def current_round
      @rounds.last
    end

    def game_over?
      if @scores.max >= 13
        return true
      else
        return false
      end
    end

    def winner
      if @scores.max < 13
        return nil
      else
        return @scores.index(@scores.max)
      end
    end

    def winner_name
      if self.winner == nil
        return nil
      else
        return @players[self.winner]
      end
    end

	end
end
