require 'spec_helper'
require './app/services/ship_placer'
require './app/services/values/board'
require './app/services/values/space'

describe AiSpaceSelector do
  it "exists" do
    target_board = Board.new(4)
    selector = AiSpaceSelector.new(target_board)
    expect(selector).to be_a AiSpaceSelector
  end
end
