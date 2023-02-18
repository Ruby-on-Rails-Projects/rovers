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
        move_forward
      end
    end
  end

end