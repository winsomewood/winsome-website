class PagesController < ApplicationController

  def front_page
    @carousel_images = ItemImages.collections[0, 3]
  end

  def find
    @page_title = "Find Us"
  end

end
