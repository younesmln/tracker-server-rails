class Client
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Geospatial

  field :first_name
  field :last_name
  field :location, type: Point

  #validates :first_name, :last_name, presence: true
end
