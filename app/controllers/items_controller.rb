class ItemsController < ApplicationController

  def index
    @items = nil
    if params[:category]
      @items = Item.where('lower(category) = ?', params[:category].downcase).order("description")
      @page_title = params[:category].capitalize
    elsif params[:collection]
      @items = Item.where('lower(collection) = ?', params[:collection].downcase).order("description")
      @page_title = params[:collection].capitalize
    else
      @items = Item.order("itemno")
      @page_title = "Products by Item Number"
    end
    @items = @items.page(params[:page] || 1)
  end

  def show
    @item = Item.find_by_itemno(params[:itemno])
  end

  def select_category
    @category_images = ItemImages.categories
    @page_title = "Select a Category"
  end

  def select_collection
    @collection_images = Kaminari.paginate_array(ItemImages.collections).page(params[:page] || 1)
    @page_title = "Select a Collection"
  end

end
