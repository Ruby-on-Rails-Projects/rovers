module Rovers

  class Movements

    def initialize(move_on: Rovers::MoveOn, spin: Rovers::Spin)
      @move_on = move_on
      @spin = spin
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
