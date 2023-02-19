module RoversHelper

  def rovers_params(params)
    permitted_params = params.permit(:position, :control)
    position = permitted_params[:position].split(" ")
    {
      direction: position[2],
      position_x: position[0].to_i,
      position_y: position[1].to_i,
      movements: permitted_params[:control].split("")
    }
  end

end
