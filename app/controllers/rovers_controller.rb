class RoversController < ApplicationController
  include RoversHelper
  PLATEAU = %w[5 5]

  def order_direction
    prepare_params

    @movements.each do |movement|
      @direction = RoversHelper::RoverDirection.new(direction: @direction, movement: movement).move
    end
    render :json => { "position": @direction }
  end

  private

  def prepare_params
    @params ||= params.permit(:position, :control)
    position = @params.dig("position").split(" ")

    @direction  = position[2]
    @position_x = position[0]
    @position_y = position[1]
    @movements  = @params.dig("control").split("")
  end

end
