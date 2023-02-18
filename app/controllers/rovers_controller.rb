class RoversController < ApplicationController
  include RoversHelper

  def order_direction
    prepare_params

    @movements.each do |movement|
      if movement == 'M'
        rover_coordinate = RoversHelper::RoverCoordinate.new(x: @position_x, y: @position_y, direction: @direction)
        rover_coordinate.move
        @position_x = rover_coordinate.coordinate_x
        @position_y = rover_coordinate.coordinate_y
      end
      @direction = RoversHelper::RoverDirection.new(direction: @direction, movement: movement).move
    end
    render :json => { "position":  "#{@position_x} #{@position_y} #{@direction}"}
  end

  private

  def prepare_params
    @params ||= params.permit(:position, :control)
    position = @params.dig("position").split(" ")

    @direction = position[2]
    @position_x = position[0].to_i
    @position_y = position[1].to_i
    @movements = @params.dig("control").split("")
  end

end
