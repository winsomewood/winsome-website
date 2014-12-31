class Catalog < ActiveType::Object

  attribute :resale, :string

  attribute :company, :string
  attribute :address_1, :string
  attribute :address_2, :string
  attribute :city, :string
  attribute :state, :string
  attribute :zip, :string
  attribute :country, :string
  attribute :phone, :string


  attribute :name, :string
  attribute :email, :string

  attribute :comments, :string

  validates_presence_of :company, :address1, :city, :state, :zip, :country, :phone, :resale
  validates :zip, format: { with: /\A\d{5}-?(\d{4})?\z/ }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  after_save :deliver

  def deliver

  end

end
