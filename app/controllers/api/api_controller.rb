class Api::ApiController < ActionController::Base

  def insert_position
    begin
      pos_array = params[:_json]
      pos_array.each do |c|
        @car = Car.where(_id: c[:imei]).first
        @car ||= Car.create(_id: c[:imei])
        @car.locations << Location.new(position: c[:position]) if @car
        @car.save
      end
    rescue Exception => e
      render text: "error #{e.message} \n\n\n #{e.backtrace.inspect}" and return
    end
    @clients = Client.all
    render template: 'clients/index.json.jbuilder'
  end
end
