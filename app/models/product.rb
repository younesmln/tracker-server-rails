class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String
  field :name
  field :desc
  field :price
end
