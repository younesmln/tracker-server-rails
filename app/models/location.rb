class Location
  include Mongoid::Document
  include Mongoid::Geospatial

  field :position, type: Point, sphere: true
  field :time, type: Time
  embedded_in :car, inverse_of: :locations

end
