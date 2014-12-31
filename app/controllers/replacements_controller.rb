class ReplacementController < ApplicationController

  before_filter :set_replacement

  def set_replacement
    @replacement = Replacement.new(replacement_params)
  end

  def new
    @page_title = "Replacement Parts Request"
  end

  def create
    if @replacement.save
      redirect_to success_path
    else
      render 'replacement'
    end
  end

  protected

  def replacement_params
    replacement_params = params[:replacement]
    if replacement_params
      replacement_params.permit(
        :first_name,
        :email,
        :replacements)
  end
end
