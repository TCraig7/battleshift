player_1_board = Board.new(4)
player_2_board = Board.new(4)

sm_ship = Ship.new(2)
md_ship = Ship.new(3)

# Place Player 1 ships
ShipPlacer.new(board: player_1_board,
               ship: sm_ship,
               start_space: "A1",
               end_space: "A2").run

ShipPlacer.new(board: player_1_board,
               ship: md_ship,
               start_space: "B1",
               end_space: "D1").run

# Place Player 2 ships
ShipPlacer.new(board: player_2_board,
               ship: sm_ship.dup,
               start_space: "A1",
               end_space: "A2").run

ShipPlacer.new(board: player_2_board,
               ship: md_ship.dup,
               start_space: "B1",
               end_space: "D1").run

game_attributes = {
  player_1_board: player_1_board,
  player_2_board: player_2_board,
  player_1_turns: 0,
  player_2_turns: 0,
  current_turn: "player_1",
  player_1_api_key: "evyiYMExhwCS15JmBM7dkRjq",
  player_2_api_key: "cezhzkVCEzUP1zzvubCGMWiF"
}

game = Game.new(game_attributes)
game.save!

user_1 = User.create!(name: "Josiah Bartlet", email: "jbartlet@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: "password")
user_2 = User.create!(name: "Jon Tester", email: "jtester@example.com", address: "Montana", password: "password")

user_1.api_key = "evyiYMExhwCS15JmBM7dkRjq"
user_1.save
user_2.api_key = "cezhzkVCEzUP1zzvubCGMWiF"
user_2.save
