class InfoMailer < ApplicationMailer
  default to: "info@winsomewood.com"

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} from #{comment.name}")
  end

end
