class InfoMailer < ApplicationMailer
  default to: "sales@winsomewood.com"

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} from #{comment.name}")
  end

  def replacement_email(replacement)
    @replacement = replacement
    mail(to: "golf.sinteppadon@gmail.com", subject: "[www.winsomewood.com] Request from #{replacement.name}")
    #mail(to: "replacement@winsomewood.com", subject: "[www.winsomewood.com] Request from #{replacement.name}")
  end

end
