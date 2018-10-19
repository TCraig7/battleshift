class TurnProcessor
  def initialize(game, target, api_key)
    @game   = game
    @target = target
    @messages = []
    @api_key = api_key
    @hit = 0
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
    if result == "Hit"
      @hit = 1
      board_selectorator.total_hits += 1
      did_it_sink
    end
    win?

    player_selectorator
  end

  def win?
    if board_selectorator.total_hits == 5
      @messages << "Game over."
      email = User.find_by_api_key(@api_key).email
      @game.update(winner: email)
      @game.save
    end
  end

  def did_it_sink
    if @hit == 1
      bs = board_selectorator.locate_space(@target)
      if bs.contents.is_sunk?
        @messages << "Battleship sunk."
      end
    end
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
