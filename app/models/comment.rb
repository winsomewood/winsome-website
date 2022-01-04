class Comment
  # Comment does not extend ActiveRecord::Base.
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

  attr_accessor :subject
  attr_accessor :name
  attr_accessor :company
  attr_accessor :email
  attr_accessor :item_number
  attr_accessor :control_number
  attr_accessor :comments

  SUBJECTS = ["Product Inquiry", "Assembly Instructions", "Dealer Inquiry", "Catalog Request", "Other"]

  validates :subject, inclusion: { in: SUBJECTS, message: "Please select a subject" }
  validates :name, presence: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Please enter a valid email"
  }
  validates :comments, presence: true
end
