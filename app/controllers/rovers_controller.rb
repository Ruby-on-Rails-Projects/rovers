class RoversController < ApplicationController

  require './app/services/rovers/movements'
  require './app/services/rovers/spin'
  require './app/services/rovers/move_on'

  def order_direction
    params_treated = helpers.rovers_params(params)
    rover_movement = Rovers::Movements.new(
      move_on: Rovers::MoveOn.new(max_position_y: params_treated[:grid][:x], max_position_x: params_treated[:grid][:y]),
      spin: Rovers::Spin.new
    )

    response_rovers = []
    params_treated[:rovers].each do |rover|
      direction = rover[:direction]
      position_x = rover[:position_x]
      position_y = rover[:position_y]

      rover[:movements].each do |movement|

        response = rover_movement.execute(
          direction: direction,
          movement: movement,
          position_x: position_x,
          position_y: position_y
        )

        position_x = response.dig(:position_x)
        position_y = response.dig(:position_y)
        direction = response.dig(:direction)
      end
      response_rovers.append({ position_x: position_x, position_y: position_y, direction: direction })
    end
    render :json => response_rovers, status: :ok
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

end
