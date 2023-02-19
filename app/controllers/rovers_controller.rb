class RoversController < ApplicationController
  require './app/services/rovers/movements'

  def order_direction
    params_treated = helpers.rovers_params(params)
    rover_movement = Rovers::Movements.new

    direction  = params_treated[:direction]
    position_x = params_treated[:position_x]
    position_y = params_treated[:position_y]

    params_treated[:movements].each do |movement|

      response = rover_movement.execute(
        direction: direction, movement: movement, position_x: position_x, position_y: position_y)

      position_x = response.dig(:position_x)
      position_y = response.dig(:position_y)
      direction  = response.dig(:direction)

    end
    render :json => { "position": "#{position_x} #{position_y} #{direction}" }
  end

end
