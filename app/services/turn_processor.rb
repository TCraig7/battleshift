class TurnProcessor
  def initialize(game, target, api_key)
    @game   = game
    @target = target
    @messages = []
    @api_key = api_key
  end

  def run!
    begin
      attack_opponent
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end
  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def attack_opponent
    result = Shooter.fire!(board: board_selectorator, target: target)
    @messages << "Your shot resulted in a #{result}."
    player_selectorator
  end

  def board_selectorator
    if @api_key == @game.player_1_api_key
      @game.player_2_board
    else
      @game.player_1_board
    end
  end

  def player_selectorator
    if @api_key == @game.player_1_api_key
      @game.player_1_turns += 1
    else
      @game.player_2_turns += 1
    end
  end
end
