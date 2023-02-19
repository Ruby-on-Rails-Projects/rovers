module Rovers
  require './app/services/rovers/spin'
  require './app/services/rovers/move_on'

  class Movements
    MAX_POSITION_Y = 5
    MAX_POSITION_X = 5

    def initialize(move_on: Rovers::MoveOn, spin: Rovers::Spin)
      @move_on = move_on.new(max_position_y: MAX_POSITION_Y, max_position_x: MAX_POSITION_X)
      @spin = spin.new
    end

    def execute(direction:, movement:, position_x:, position_y:)
      if movement == 'M'
        position = @move_on.execute(position_x: position_x, position_y: position_y, direction: direction)
        position_x = position.dig(:position_x)
        position_y = position.dig(:position_y)
      else
        direction = @spin.execute(direction: direction, movement: movement)
      end
      {
        position_x: position_x,
        position_y: position_y,
        direction: direction
      }
    end
  end
end
