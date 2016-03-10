class Invoice
  include Mongoid::Document
  field :total, type: Float
  field :remaining, type: Float

  embedded_in :client
end
