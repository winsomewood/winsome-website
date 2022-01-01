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

  has_many :kits, foreign_key: "kitno", primary_key: "itemno"
  validates_presence_of :itemno, :upc, :description, :category, :length, :width, :height

  def sorted_valid_kits
    # There can be kits with invalid items in the DB (due to DB values changing over time)
    # Lets filter them out at query time for now
    # Maybe one day we can add a foreign key constraint at the DB level but that would also
    # make it more annoying to maintain
    kits.order(:name).filter { |child| child.item.present? }
  end

  def set_components
    Item.joins("join kits on kits.itemno = items.itemno").where("kits.kitno = ?", itemno)
  end

  def parent_kits
    Item.joins("join kits on kits.kitno = items.itemno").where("kits.itemno = ?", itemno)
  end

  def scan_filesystem_images
    children_itemnos = set_components.pluck(:itemno)

    client = Aws::S3::Client.new(
      access_key_id: 'UOQFX6JP4UGYEIIPPB7U',
      secret_access_key: ENV['DIGITALOCEAN_SPACES_SECRET_KEY'],
      endpoint: 'https://sfo3.digitaloceanspaces.com',
      region: 'us-east-1'
    )

    [self.itemno, *children_itemnos].map do |n|
      client.list_objects(bucket: "winsome-images", prefix: "images/584/#{n}").contents.map(&:key)
    end.flatten.map do |file_path|
      # truncate path e.g. "images/584/12345_test.jpg" => "12345_test.jpg"
      file_path[file_path.rindex("/")+1..]
    end
  end

end
