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

  has_many :kits, :foreign_key => "itemno"

  def self.entry_name
    'item'
  end
  def images_200_px
    ::ItemImages.size_200[itemno] || []
  end

  def images_584_px
    ::ItemImages.size_584[itemno] || []
  end
end
