class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :label, type: String
  field :desc, type: String
  field :price, type: Float
  field :count, type: Integer, default: 0

  belongs_to :invoice, inverse_of: 'products'
  def id
    self._id.to_s
  end
end
