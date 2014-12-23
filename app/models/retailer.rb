# == Schema Information
#
# Table name: retailers
#
#  id         :integer          not null, primary key
#  name       :string
#  src        :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Retailer < ActiveRecord::Base
  validates_presence_of :name, :src, :url
end
