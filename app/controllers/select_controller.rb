class SelectController < ApplicationController
  def category
    @category_names = Item.group(:category).having("count(*) >= 1").select("category").size.keys.sort
    @page_title = "Select a Category"
  end

  def collection
    @collection_names = Item.group(:collection).having("count(*) >= 2").select("collection").size.keys.reject(&:blank?).sort
    @page_title = "Select a Collection"
  end
end
