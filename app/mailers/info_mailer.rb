class InfoMailer < ApplicationMailer
  default to: Rails.env.production? ? "info@winsomewood.com" : "golf.sinteppadon@gmail.com"

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} - from #{comment.name}")
  end

end
