class InfoMailer < ApplicationMailer
  default to: "sales@winsomewood.com"

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] #{comment.subject} from #{comment.name}", bcc: "golfs@winsomewood.com")
  end

  def replacement_email(replacement)
    @replacement = replacement
    if replacement.proof_of_purchase
      attachments[replacement.proof_of_purchase.original_filename] = File.open(replacement.proof_of_purchase, 'rb') {|f| f.read}
    end
    if !replacement.additional_images.empty?
      replacement.additional_images.each do |image|
        attachments[image.original_filename] = File.open(image, 'rb') {|f| f.read}
      end
    end
    mail(
      to: "Replacements.Pending@winsomewood.com",
      bcc: "golfs@winsomewood.com",
      subject: "[www.winsomewood.com] Request from #{replacement.name}"
    )
  end

end
