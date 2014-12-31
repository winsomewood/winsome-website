class InfoMailer < ApplicationMailer
  default to: Rails.env.production? ? "info@winsomewood.com" : "golf.sinteppadon@gmail.com"

  def replacements_email(replacement)
    @replacement = replacement
    mail(subject: "[www.winsomewood.com] Replacement Request", body: replacement.to_s)
  end

  def catalog_email(catalog)
    @catalog = catalog
    mail(subject: "[www.winsomewood.com] Catalog Request", body: catalog.to_s)
  end

  def comments_email(comment)
    @comment = comment
    mail(subject: "[www.winsomewood.com] Comment from comment.name")
  end

end
