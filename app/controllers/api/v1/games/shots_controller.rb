module Api
  module V1
    module Games
      class ShotsController < ApiController
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
      end
    end
  end
end
