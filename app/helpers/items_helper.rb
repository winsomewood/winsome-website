module ItemsHelper
  def display_dimensions_english(item)
    "#{item.length} in x #{item.width} in x #{item.height} in"
  end

  def display_dimensions_metric(item)
    "#{(item.length.to_f * 2.54).round(1)} cm x #{(item.width.to_f * 2.54).round(1)} cm x #{(item.height.to_f * 2.54).round(1)} cm"
  end

  def display_collection(item)
    item.collection.present? ? item.collection : "N/A"
  end
end
