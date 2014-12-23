module ItemsHelper
  def display_dimensions_english(item)
    "#{item.length} in x #{item.width} in x #{item.height} in"
  end

  def display_dimensions_metric(item)
    "#{(item.length.to_i * 2.54).round(2)} cm x #{(item.width.to_i * 2.54).round(2)} cm x #{(item.height.to_i * 2.54).round(2)} cm"
  end

end
