module Rovers
  class Spin

    MOVE_LEFT = { 'N' => 'W', 'W' => 'S', 'S' => 'E', 'E' => 'N' }
    MOVE_RIGHT = { 'N' => 'E', 'W' => 'N', 'S' => 'W', 'E' => 'S' }

    def execute(direction:, movement:)
      if movement == 'R'
        MOVE_RIGHT[direction]
      elsif movement == 'L'
        MOVE_LEFT[direction]
      end
    end
  end
end
