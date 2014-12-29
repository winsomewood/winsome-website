class ContactController < ApplicationController

  before_filter :set_inquiry, :only => [:contact, :submit_inquiry]

  def set_inquiry
    @inquiry = Inquiry.new(params[:inquiry])
  end

  def contact
    @page_title = "Contact Us"
  end

  def submit_inquiry
    Inquiry.new(params[:inquiry])

    if @inquiry.save
      redirect_to inquiry_success_path
    else
      render 'contact'
    end
  end
end
