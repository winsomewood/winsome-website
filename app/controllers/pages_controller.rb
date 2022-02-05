class PagesController < ApplicationController

  def handle_404
  end

  def front_page
    @page_title = "Quality lifestyle furniture"
    @og_description = "Winsome began manufacturing and distributing solid wood housewares in 1977, and today it is one of the leading brands of lifestyle furniture. Offering innovative designs with unbeatable balance between craftsmanship and affordability."
    @og_image = request.url + "images/collections/Richmond.jpg"
  end

  def about
  end

  def retailers
    @page_title = "Retailers"
    @og_description = "Winsome is a furniture wholesaler, and we do not sell our products directly to the public. Our products are available from our many retail partners. If you wish to make a purchase, please contact the retailers directly."
  end

  def success
  end
end
