class Api::ApiController < ActionController::Base

  def insert_position
    begin
      pos_array = params[:_json]
      pos_array.each do |c|
        @car = Car.where(_id: c[:imei]).first

        @car.push(location:[c[:position]]) if @car
      end
    rescue => e
      render text: "error" and return
    end
    render text: "ok"
  end
end
