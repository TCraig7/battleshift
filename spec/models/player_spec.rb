require 'rails_helper'

describe Player, type: :model do
  it "exists" do
    board = Board.new(4)
    player = Player.new(board)

    expect(player).to be_a Player
  end
end
