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
        board_1 = Board.new(4)
        board_2 = Board.new(4)
        game = Game.create( player_1_board: board_1,
                            player_2_board: board_2)
        render json: game
      end
    end
  end
end
