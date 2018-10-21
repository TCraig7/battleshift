# require 'spec_helper'
#
# describe "turn processor" do
#   before(:each) do
#     @player_1 = User.create!(name: "Josiah Bartlett", email: "jbartlett@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: '1234', api_key: '1234')
#     @player_2 = User.create!(name: "Jon Tester", email: "jtester@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: '4321', api_key: '4321')
#     @game_1 = Game.create!(player_1_board: Board.new(4),
#                         player_2_board: Board.new(4),
#                         player_1_api_key: @player_1.api_key,
#                         player_2_api_key: @player_2.api_key)
#   end
#
#   it "should check current_turn" do
#     tp = TurnProcessor.new(@game_1, "A1", )
#
#   end
# end
