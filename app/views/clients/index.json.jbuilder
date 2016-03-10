json.array!(@clients) do |client|
  json.extract! client, :id, :f_name, :l_name, :phone, :location
  json.url client_url(client, format: :json)
  json.remaining client.invoices.reduce(0) { |s,inv| s+inv.remaining}
end
/ :client.id/
