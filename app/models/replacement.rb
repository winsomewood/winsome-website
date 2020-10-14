class Replacement < ActiveType::Object

  attribute :name, :text
  attribute :address1, :text
  attribute :address2, :text
  attribute :address_type, :text
  attribute :city, :text
  attribute :state, :text
  attribute :zip, :text
  attribute :phone, :text
  attribute :email, :text

  attribute :purchase_date, :text
  attribute :retailer, :text
  attribute :controlno, :text
  attribute :itemno, :text
  attribute :r, :text
  attribute :description, :text

  attribute :send_full_hardware_set, :boolean
  attribute :parts, :text

  attribute :proof_of_purchase
  attribute :comments, :text

  validates :name, presence: true
  validates :address1, presence: true
  validates :address_type, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Please enter a valid email"
  }
  validates :purchase_date, presence: true
  validates :retailer, presence: true
  validates :controlno, presence: true
  validates :itemno, presence: true
  validates :description, presence: true


  after_save lambda { InfoMailer.replacement_email(self).deliver_now }

end
