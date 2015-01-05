module ItemImages
  def self.collections
    self.get_file_names_from_directory("#{Rails.root}/public/images/collections", "collections")
  end

  def self.categories
    self.get_file_names_from_directory("#{Rails.root}/public/images/categories", "categories")
  end

  def self.size_200
    image_names = self.get_file_names_from_directory(
      "#{Rails.root}/public/images/200",
      "size_200"
    )
    self.key_by_item_number(image_names)
  end

  def self.size_584
    image_names = self.get_file_names_from_directory(
      "#{Rails.root}/public/images/584",
      "size_584"
    )
    self.key_by_item_number(image_names)
  end

  protected

  def self.get_file_names_from_directory(directory, cache_key)
    Rails.cache.fetch(cache_key, expires_in: 1.second) do
      base_pathname = Pathname.new(directory)
      Dir["#{directory}/*"].map do |file|
        Pathname.new(file).relative_path_from(base_pathname).to_s
      end
    end
  end

  def self.key_by_item_number(image_names)
    result_map = {}
    image_names.each do |image_name|
      item_number = image_name[0, image_name.index(/[-_.]/)].to_i
      result_map[item_number] ||= []
      result_map[item_number] << image_name
    end
    result_map
  end
end
