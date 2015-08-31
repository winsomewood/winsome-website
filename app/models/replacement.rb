class Replacement < ActiveType::Object

  attribute :name, :text
  attribute :address1, :text
  attribute :address2, :text
  attribute :city, :text
  attribute :state, :text
  attribute :zip, :text
  attribute :phone, :text
  attribute :email, :text
  attribute :purchased_at, :text
  attribute :retailer, :text
  attribute :controlno, :text
  attribute :itemno, :text
  attribute :description, :text
  attribute :partno1, :text
  attribute :quantity1, :text
  attribute :partname1, :text
  attribute :reason1, :text
  attribute :partno2, :text
  attribute :quantity2, :text
  attribute :partname2, :text
  attribute :reason2, :text
  attribute :partno3, :text
  attribute :quantity3, :text
  attribute :partname3, :text
  attribute :reason3, :text

  validates :name, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :purchased_at, presence: true
  validates :retailer, presence: true
  validates :controlno, presence: true
  validates :itemno, presence: true
  validates :description, presence: true
  validates :partno1, presence: true
  validates :quantity1, presence: true
  validates :partname1, presence: true
  validates :reason1, presence: true

  after_save lambda { InfoMailer.replacement_email(self).deliver_now }

end
