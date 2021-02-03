class Replacement
  # Replacement does not extend ActiveRecord::Base.
  # It is an Active Model instead of an ActiveRecord Model.
  # That means it has some features like attributes &
  # validations, but is not backed by a table in the database.
  # https://guides.rubyonrails.org/active_model_basics.html
  #
  # We do this to be able to define a large set of validations
  # using Active Model syntax, then call `valid?` to check if
  # those validations pass
  include ActiveModel::Model
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations

  attr_accessor :name
  attr_accessor :address1
  attr_accessor :address2
  attr_accessor :address_type
  attr_accessor :city
  attr_accessor :state
  attr_accessor :zip
  attr_accessor :phone
  attr_accessor :email

  attr_accessor :purchase_date
  attr_accessor :retailer
  attr_accessor :controlno
  attr_accessor :itemno
  attr_accessor :r
  attr_accessor :description

  attr_accessor :send_full_hardware_set
  attr_accessor :parts

  attr_accessor :proof_of_purchase
  attr_accessor :proof_of_purchase_filename
  attr_accessor :comments

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
  validates :send_full_hardware_set, presence: true

  # creates a json in the format provided
  def to_json
    {
      name: name,
      address1: address1,
      address2: address2,
      address_type: address_type,
      city: city,
      state: state,
      zip: zip,
      phone: phone,
      email: email,
      retailer: retailer,
      purchase_date: purchase_date,
      description: description,
      itemno: itemno,
      controlno: controlno,
      send_full_hardware_set: send_full_hardware_set,
      parts: parts,
      comments: comments,
      proof_of_purchase_filename: proof_of_purchase_filename
    }
  end
end
