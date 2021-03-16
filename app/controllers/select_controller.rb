class SelectController < ApplicationController
  def category
    @category_names = Item.group(:category).having("count(*) >= 1").select("category").size.keys.sort
    @page_title = "Select a Category"
  end

  def collection
    # this will work w/no error if collection is null
    @collection_names = Item.group(:collection).having("collection is not null and count(*) >= 2").select("collection").size.keys.sort.reject(&:blank?)
    @page_title = "Select a Collection"
  end
end
