module Api
  module V1
    class GamesController < ActionController::API
      
      def show
        if game = Game.find_by(id: params[:id])
          render json: game
        else
          render :status => 400
        end
      end
      
      def create
        game = Game.new(game_attributes)
        if game.save
            render json: game, status: 200
        else
          render status: 400
        end
      end

      private 
        def game_attributes
          { 
            player_1_board: Board.new(4),
            player_2_board: Board.new(4)
          }
        end
    end
  end
end

