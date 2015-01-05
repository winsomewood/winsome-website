class SelectController < ApplicationController
  def category
    @category_images = ItemImages.categories
    @page_title = "Select a Category"
  end

  def collection
    @collection_images = ItemImages.collections
    @page_title = "Select a Collection"
  end
end
