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

require 'test_helper'

class KitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
