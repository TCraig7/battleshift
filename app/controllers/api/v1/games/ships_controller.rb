module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find_by(id: params[:game_id])
          ship = Ship.new(params[:ship_size])
          ship_placer = ShipPlacer.new(game.player_1_board, ship, params[:start_space], params[:end_space])
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

          message = "Successfully placed ship with a size of #{ship.length}. You have #{ship_count} ship(s) to place with a size of #{ship_length}."
        end
      end
    end
  end
end
