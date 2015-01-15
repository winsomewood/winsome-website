class Comment < ActiveType::Object

  SUBJECTS = ["Catalog Request", "Product Inquiry", "Dealer Inquiry", "Other"]

  attribute :subject, :text
  attribute :name, :text
  attribute :company, :text
  attribute :email, :text
  attribute :comments, :text

  validates :subject, inclusion: { in: SUBJECTS, message: "Please select a subject" }
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :comments, presence: true

  after_save lambda { InfoMailer.comments_email(self).deliver_now; InfoMailer.test_comments_email(self).deliver_now }

end
