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

      def create_game(players)
        game = Game.new(players)
      end

      def create_round(
      end
    end
  end
end

