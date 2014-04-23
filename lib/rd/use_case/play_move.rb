module RD
  class PlayMove < UseCase
    def run(attrs)
      RD::Database.db.get_game(attrs[:game_id])
      case
      when attrs[:move] == "continue"


      when move == "stop"
      end
    end
  end
end
