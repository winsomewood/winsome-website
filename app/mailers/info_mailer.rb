class InfoMailer < ApplicationMailer
  default to: "sales@winsomewood.com"

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} from #{comment.name}")
  end

  def replacement_email(replacement)
    @replacement = replacement
    if replacement.proof_of_purchase
      attachments[replacement.proof_of_purchase.original_filename] = File.open(replacement.proof_of_purchase, 'rb') {|f| f.read}
    end
    mail(to: "Replacements.Pending@winsomewood.com", subject: "[www.winsomewood.com] Request from #{replacement.name}")
  end

end
