class Comment < ActiveType::Object

  SUBJECTS = ["Catalog Request", "Product Inquiry", "Dealer Inquiry", "Other"]

  attribute :subject, :string
  attribute :name, :string
  attribute :company, :string
  attribute :email, :string
  attribute :comments, :string

  validates :subject, inclusion: { in: SUBJECTS, message: "Please select a subject" }
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :comments, presence: true

  after_save lambda { InfoMailer.comments_email(self).deliver_now }

end
