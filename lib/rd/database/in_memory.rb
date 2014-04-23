module RD
  module Database
    def self.db
      @db ||= InMemory.new
    end

    class InMemory
      def initialize()
        clear_everything
      end

      def clear_everything
        @game_id_counter = 100
        @round_id_counter = 200
        @games = {}
        @rounds = {}
      end

      def create_game(attrs)
        attrs[:id] = (@game_id_counter += 1)
        game = Game.new(attrs)
      end

      def create_round(attrs)
        attrs[:id] = (@round_id_counter += 1)
        round = Round.new(attrs)
      end
    end
  end
end

