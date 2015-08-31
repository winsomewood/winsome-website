class ReplacementsController < ApplicationController

  before_filter :set_page_title
  before_filter :set_replacement

  def set_page_title
    @page_title = "Replacement Request"
  end

  def set_replacement
    @replacement = Replacement.new(replacement_params)
  end

  def new
  end

  def create
    if @replacement.save
      redirect_to success_path
    else
      render 'new'
    end
  end

  protected

  def replacement_params
    replacement_params = params[:replacement]
    replacement_params.permit(:name,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :phone,
      :email,
      :purchased_at,
      :retailer,
      :controlno,
      :itemno,
      :description,
      :partno1,
      :quantity1,
      :partname1,
      :reason1,
      :partno2,
      :quantity2,
      :partname2,
      :reason2,
      :partno3,
      :quantity3,
      :partname3,
      :reason3
    ) if replacement_params
  end
end
