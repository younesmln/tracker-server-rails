json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :total, :remaining
  json.url invoice_url(invoice, format: :json)
end
