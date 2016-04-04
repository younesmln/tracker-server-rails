module ClientsHelper

  def products_format(invoice)
    result = ''
    invoice.products.each do |pr|
      result += "<li><a>#{pr[:label]}<span class='badge'>#{pr[:count]}</span></a></li>"
    end
    result.html_safe
  end
end
