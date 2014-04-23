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

	end
end
