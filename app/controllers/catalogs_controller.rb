class CatalogsController < ApplicationController

  before_filter :set_catalog

  def set_catalog
    @catalog = Catalog.new(catalog_params)
  end

  def new
    @page_title = "Catalog Parts Request"
  end

  def create
    if @catalog.save
      redirect_to success_path
    else
      render 'new'
    end
  end

  protected

  def catalog_params
    catalog_params = params[:catalog]
    catalog_params.permit(
      :company,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :country,
      :phone,
      :name,
      :email,
      :resale,
      :comments
    ) if catalog_params
  end
end
