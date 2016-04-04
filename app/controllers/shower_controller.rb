class ShowerController < ApplicationController
  layout 'maps_layout'

  def map
    cars = Car.all
    @positions = []
    cars.each do |car|
      @positions << {position: car.locations.last.position,
                     time: car.locations.last.time
      }
    end
    @positions = @positions.to_json
    respond_to do |format|
      format.html { render template: 'shower/map' }
      format.json { render json: @positions }
    end
  end

  def hello
  end
end