json.extract! @client, :id, :f_name, :l_name, :phone, :location, :created_at
json.invoices @client.invoices
