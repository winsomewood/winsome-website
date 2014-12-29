class Inquiry < ActiveType::Object

  attribute :name, :string
  attribute :email, :string
  attribute :comments, :string

  validates :name, :presence => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :comments, :presence => true

  after_save :send_inquiry

  def send_inquiry
