class Invoice
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  field :total, type: Float
  field :remaining, type: Float, default: Proc.new { self.total }
  field :products, type: Array

  embedded_in :client


  validates :products, presence: true

  after_save do |document|
    p document[:products]
    nil
  end

  def id
    self._id.to_s
  end

  def products_list
    products = self.products.map {|p| p[:product_id] }
    Product.find products
  end

end
