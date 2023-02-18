module RoversHelper

  class RoverDirection
    MOVE_LEFT = { 'N' => 'W', 'W' => 'S', 'S' => 'E', 'E' => 'N' }
    MOVE_RIGHT = { 'N' => 'E', 'W' => 'N', 'S' => 'W', 'E' => 'S' }

    attr_accessor :direction

    def initialize (direction:, movement:)
      @direction = direction
      @movement = movement
    end

    def move
      if @movement == 'R'
        MOVE_RIGHT[@direction]
      elsif @movement == 'L'
        MOVE_LEFT[@direction]
      else
        @direction
      end
    end
  end

  class RoverCoordinate
    attr_accessor :x, :y, :direction
    MAX_Y = 5
    MAX_X = 5

    def initialize (x:, y:, direction:)
      @coordinate_x = x
      @coordinate_y = y
      @direction = direction
    end

    def move
      if @direction == 'N'
        @coordinate_y += 1
        if @coordinate_y > MAX_Y
          @coordinate_y = 0
        end
      end

      if @direction == 'E'
        @coordinate_x += 1
        if @coordinate_x > MAX_X
          @coordinate_x = 0
        end
      end

      if @direction == 'W'
        @coordinate_x > 0 ? @coordinate_x -= 1 : @coordinate_x = MAX_X - 1
      end
    end

    def coordinate_x
      @coordinate_x
    end

    def coordinate_y
      @coordinate_y
    end
  end

end