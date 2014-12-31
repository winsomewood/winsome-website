class Comment < ActiveType::Object

  attribute :name, :string
  attribute :email, :string
  attribute :comments, :string

  validates :name, :presence => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :comments, :presence => true

  after_save lambda { InfoMailer.comments_email(self).deliver_now }

end
