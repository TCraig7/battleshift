module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :game_winner_check, :check_api_keys

        def create
          game = Game.find_by(id: params[:game_id])

          turn_processor = TurnProcessor.new(game, params[:shot][:target], request.headers["X-API-Key"])
          if turn_processor.check_current_player
            turn_processor.run!
            if turn_processor.message.include?("Invalid")
              render json: game, :status => 400, message: turn_processor.message
            else
              render json: game, message: turn_processor.message
            end
          else
            render json: game, :status => 400, message: "Invalid move. It's your opponent's turn"
          end
        end

        private
          def game_winner_check
            game = Game.find_by(id: params[:game_id])
            if game.winner
              render json: game, :status => 400, message: "Invalid move. Game over."
            end
          end

          def check_api_keys
            game = Game.find_by(id: params[:game_id])
            if request.headers["X-API-KEY"] != game.player_1_api_key && request.headers["X-API-KEY"] != game.player_2_api_key
              render json: game, :status => 401, message: "Unauthorized"
            end
          end
      end
    end
  end
end
