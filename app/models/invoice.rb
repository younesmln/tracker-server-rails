class Invoice
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  field :total, type: Float
  field :remaining, type: Float

  embedded_in :client
  has_many :products, inverse_of: 'invoice'


  def id
    self._id.to_s
  end

end
