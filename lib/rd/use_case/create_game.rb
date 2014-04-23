module RD
  class CreateGame < UseCase
    def run(players)
      game = RD::Database.db.create_game(players)
      return success :game => game
    end
  end
end


