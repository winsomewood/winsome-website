class Catalog < ActiveType::Object

  attribute :company, :string
  attribute :address1, :string
  attribute :address2, :string
  attribute :city, :string
  attribute :state, :string
  attribute :zip, :string
  attribute :country, :string
  attribute :phone, :string


  attribute :name, :string
  attribute :email, :string

  attribute :resale, :string

  attribute :comments, :string

  validates_presence_of :company, :address1, :city, :state, :zip, :country, :phone, :resale
  validates :zip, format: { with: /^\d{5}-?(\d{4})?$/ }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  after_save :deliver

  def deliver

  end

end
