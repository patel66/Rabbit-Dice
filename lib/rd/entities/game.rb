module RD
	class Game
		attr_accessor :players, :scores, :rounds
		def initialize(players)
			@players = players
			@scores = Array.new(@players.length){0}
			@rounds = []
		end 
	end
end