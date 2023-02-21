module Rovers
  class MoveOn

    def initialize(max_position_y:, max_position_x:)
      @max_position_y = max_position_y
      @max_position_x = max_position_x
    end

    def execute(position_x:, position_y:, direction:)
      case direction
      when 'N'
        position_y += 1
        position_y % @max_position_x
      when 'E'
        position_x += 1
        position_x % @max_position_x
      when 'S'
        (position_y > 0) ? position_y -= 1 : position_y = @max_position_y - 1
      when 'W'
        (position_x > 0) ? position_x -= 1 : position_x = @max_position_x - 1
      end
      { position_x: position_x, position_y: position_y }
    end
  end
end
