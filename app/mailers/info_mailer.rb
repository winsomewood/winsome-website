class InfoMailer < ApplicationMailer
  # default to: "sales@winsomewood.com"
  default to: "patrins@winsomewood.com"

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} from #{comment.name}")
  end

  def replacement_email(replacement)
    @replacement = replacement
    if replacement.proof_of_purchase
      attachments[replacement.proof_of_purchase.original_filename] = replacement.proof_of_purchase.read
    end
    # mail(to: "replacement@winsomewood.com", subject: "[www.winsomewood.com] Request from #{replacement.name}")
    # mail(to: "patrins@winsomewood.com", subject: "[www.winsomewood.com] Request from #{replacement.name}")
  end

end
