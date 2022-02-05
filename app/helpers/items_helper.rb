module ItemsHelper
  def display_dimensions(item)
    request.env['HTTP_ACCEPT_LANGUAGE']&.include?("en-US") ?
    "#{item.length} x #{item.width} x #{item.height} inches" :
    "#{(item.length.to_f * 2.54).round(1)} x #{(item.width.to_f * 2.54).round(1)} x #{(item.height.to_f * 2.54).round(1)} cm"
  end
end
