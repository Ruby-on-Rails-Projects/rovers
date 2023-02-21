class RoversController < ApplicationController

  before_action :params_treated, :rover_movement, only: [:create]

  require './app/services/rovers/movements'
  require './app/services/rovers/spin'
  require './app/services/rovers/move_on'

  def create

    @response_rovers = []
    @params_treated[:rovers].each do |rover|
      create_movement(rover: rover)
    end
    render :json => @response_rovers, status: :ok
  end

  private

  def rover_movement
    @rover_movement ||= Rovers::Movements.new(
      move_on: Rovers::MoveOn.new(
        max_position_y: @params_treated[:grid][:x], max_position_x: @params_treated[:grid][:y]),
      spin: Rovers::Spin.new
    )
  end

  def params_treated
    @params_treated ||= helpers.rovers_params(params)
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def create_movement(rover:)

    direction = rover[:direction]
    position_x = rover[:position_x]
    position_y = rover[:position_y]

    rover[:movements].each do |movement|
      response = @rover_movement.execute(
        direction: direction,
        movement: movement,
        position_x: position_x,
        position_y: position_y
      )
      position_x = response.dig(:position_x)
      position_y = response.dig(:position_y)
      direction = response.dig(:direction)
    end
    @response_rovers.append({ position_x: position_x, position_y: position_y, direction: direction })
  end

end
