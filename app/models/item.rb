# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  itemno      :integer
#  kit         :boolean
#  upc         :string
#  collection  :string
#  description :string
#  category    :string
#  finish      :string
#  material    :string
#  assembly    :boolean
#  length      :string
#  width       :string
#  height      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base

  has_many :kits, :foreign_key => "kitno"
  validates_presence_of :itemno, :upc, :description, :category, :length, :width, :height

  def set_components
    Item.joins("join kits on kits.itemno = items.itemno").where("kits.kitno = ?", itemno)
  end

  def parent_kits
    Item.joins("join kits on kits.kitno = items.itemno").where("kits.itemno = ?", itemno)
  end

  def images_200_px
    children_itemnos = set_components.pluck(:itemno)

    (::ItemImages.size_200[self.itemno] || []) +
    ::ItemImages.size_200.select { |k| children_itemnos.include?(k) }.values.flatten
  end

  def images_584_px
    ::ItemImages.size_584[self.itemno] || []
  end

end

module ItemImages
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
      end.sort
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
