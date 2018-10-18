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

  def check_current_player
    if @api_key == @game.player_1_api_key
      return true if @game.current_turn == "player_1"
    elsif @api_key != @game.player_1_api_key
      return true if @game.current_turn == "player_2"
    else
      return false
    end
  end

  private

  attr_reader :game, :target

  def attack_opponent
    @api_key == @game.player_1_api_key
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
      @game.update(current_turn: 1)
    else
      @game.player_2_turns += 1
      @game.update(current_turn: 0)
    end
  end
end
