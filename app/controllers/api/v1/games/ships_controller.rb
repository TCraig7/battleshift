module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find_by(id: params[:game_id])
          ship = Ship.new(params[:ship_size])
          if request.headers["X-API-Key"] == game.player_1_api_key
            ship_placer = ShipPlacer.new(board: game.player_1_board, ship: ship, start_space: params[:start_space], end_space: params[:end_space])
          else
            ship_placer = ShipPlacer.new(board: game.player_2_board, ship: ship, start_space: params[:start_space], end_space: params[:end_space])
          end
          ship_placer.run

          if game.player_1_board.count == 5
            ship_count = 0
          else
            ship_count = 1
          end

          if ship.length == 3
            ship_length = 2
          else
            ship_length = 3
          end

          if ship_count == 0
            message = "Successfully placed ship with a size of #{ship.length}. You have 0 ship(s) to place."
          else
            message = "Successfully placed ship with a size of #{ship.length}. You have #{ship_count} ship(s) to place with a size of #{ship_length}."
          end
          game.save
          render json: game, message: message
        end
      end
    end
  end
end
