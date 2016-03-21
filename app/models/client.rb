class Client
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Geospatial

  field :f_name, type: String
  field :l_name, type: String
  field :phone, type: String
  field :location, type: Point, sphere: true
  spatial_scope :location
  #geo_spacial
  embeds_many :invoices, inverse_of: :client

  def id
  	self._id.to_s
  end

end
