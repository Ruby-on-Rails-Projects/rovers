module RoversHelper

  def rovers_params(params)

    grid = params.require(:grid).split(" ")
    rovers = params.require(:rovers)

    parameters = {
      grid: {
        x: grid[0].to_i, y: grid[1].to_i }, rovers: []
    }
    rovers.each do |rover|
      position = rover.require(:position)
      control = rover.require(:control)

      position = position.split(" ")
      parameters[:rovers].append(
        {
          direction: position[2],
          position_x: position[0].to_i,
          position_y: position[1].to_i,
          movements: control.split("")
        })
    end
    parameters
  end

end
