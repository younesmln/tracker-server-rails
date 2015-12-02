class Car
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :_id, type: String
  embeds_many :locations, inverse_of: :car
end
