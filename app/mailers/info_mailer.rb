class InfoMailer < ApplicationMailer
  default to: "info@winsomewood.com"

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} from #{comment.name}")
  end

  def test_comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} from #{comment.name}", to: "golf.sinteppadon@gmail.com")
  end

end
