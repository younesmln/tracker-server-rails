json.array!(@products) do |product|
  json.extract! product, :id, :label, :desc, :price, :count
  json.url product_url(product, format: :json)
end
