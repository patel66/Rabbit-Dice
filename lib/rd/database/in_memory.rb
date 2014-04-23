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
        @games[game.id] = game
        game
      end

      def create_round(attrs)
        attrs[:id] = (@round_id_counter += 1)
        round = Round.new(attrs)
        self.get_game(attrs[:game_id]).add_round(round)
        round
      end

      def get_game(game_id)
        @games[game_id]
      end


    end
  end
end

