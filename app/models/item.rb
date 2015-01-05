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

  def images_200_px
    children_itemnos = set_components.pluck(:itemno)

    (::ItemImages.size_200[self.itemno] || []) +
    ::ItemImages.size_200.select { |k| children_itemnos.include?(k) }.values.flatten
  end

  def images_584_px
    ::ItemImages.size_584[self.itemno] || []
  end

end
