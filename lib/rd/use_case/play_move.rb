module RD
  class PlayMove < UseCase
    def run(attrs)
      game = RD::Database.db.get_game(attrs[:game_id])
      round = RD::Database.db.get_game(current_round)

      if attrs[:move] == "continue"
        ## run 'round.continue'
        round_result = round.continue
      else
        round_result = round.stop
      end

      ## IF round is over
      if round_result[:round_over] == true

        ## IF game is over
        if game.game_over?
          return success ({ game_over: true, winner: game.winner, winner_name: game.winner_name,
                            scores: game.scores, round_over: true })

        else # round is over, game is not
          # start a new round
          RD::Database.db.create_round({ game_id: game.id, starting_scores: game.scores, players: game.players })
          return success ({ round_over: true, game_over: false, current_scores: round_result.current_scores,
                              advance_player: player, dice_rolls: round_result.dice_rolls })
        end
      else (round is not over)
        return success ({ round_over: false, advance_player: false, pending_score: round_result.pending_score,
                          dice_rolls: round_result.dice_rolls })
      end
    end
  end
end
