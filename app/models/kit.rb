# == Schema Information
#
# Table name: kits
#
#  id         :integer          not null, primary key
#  kitno      :integer
#  itemno     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kit < ActiveRecord::Base
  validates_uniqueness_of :itemno, scope: :kitno

  def item
    Item.find_by(itemno: self.itemno)
  end
end
