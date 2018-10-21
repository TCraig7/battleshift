require 'rails_helper'

describe "Ship" do
  context "POST /api/v1/games/:id/ships" do
    it "can place ships" do
      player_1 = User.create!(name: "Josiah Bartlett", email: "jbartlett@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: '1234', api_key: '1234')
      player_2 = User.create!(name: "Jon Tester", email: "jtester@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: '4321', api_key: '4321')
      game_1 = Game.create!(player_1_board: Board.new(4),
                          player_2_board: Board.new(4),
                          player_1_api_key: player_1.api_key,
                          player_2_api_key: player_2.api_key)

      headers = { "CONTENT-TYPE" => "application/json", "X-API-KEY" => player_1.api_key}
      ship_attributes = { ship_size: 2, start_space: "A1", end_space: "A2" }.to_json
      post "/api/v1/games/#{game_1.id}/ships", params: ship_attributes, headers: headers
      game = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      headers = { "CONTENT-TYPE" => "application/json", "X-API-KEY" => player_2.api_key}
      post "/api/v1/games/#{game_1.id}/ships", params: ship_attributes, headers: headers
      game = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
    end
  end
end
