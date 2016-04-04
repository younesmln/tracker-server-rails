class Api::ApiController < ActionController::Base

  def insert_position
    pos_array = params[:_json]
    begin
      if pos_array.respond_to? :each
        pos_array.each do |c|
          @car = Car.where(_id: c[:imei]).first
          @car ||= Car.create(_id: c[:imei])
          @car.locations << Location.new(position: c[:position]) if @car
          @car.save
        end
      end
    rescue Exception => e
      render text: "error #{e.message} \n\n\n #{e.backtrace.inspect}" and return
    end
    @clients = Client.all
    render template: 'clients/index.json.jbuilder'
  end
end
