module RD
  class PlayMove < UseCase
    def run(attrs)
      game = RD::Database.db.get_game(attrs[:game_id])
      round = RD::Database.db.get_game(current_round)
      case
      when attrs[:move] == "continue"
        ## run 'round.continue'
        round_result = round.continue
        ## IF round is over

          ## IF game is over
            ## return game_over, winner, etc
          ## ELSE
            ## start a new round with the correct data
            ## return results of the player's move

        ## ELSE (if round is not over)
          ## IF current_player is still the same
            ## RETURN results of player's move (w/ next_turn = false)






      when move == "stop"
      end
    end
  end
end
