module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find_by(id: params[:game_id])

          turn_processor = TurnProcessor.new(game, params[:shot][:target], request.headers["X-API-Key"])
          if turn_processor.check_current_player
            turn_processor.run!
            render json: game, message: turn_processor.message
          else
            render json: game, :status => 400, message: turn_processor.message
          end
        end
      end
    end
  end
end
