class ContactController < ApplicationController

  before_filter :set_comment, :only => [:contact, :submit_comment]

  def set_comment
    @comment = Comment.new(comment_params)
  end

  def contact
    @page_title = "Contact Us"
  end

  def submit_comment
    if @comment.save
      redirect_to success_path
    else
      render 'contact'
    end
  end

  def success
  end

  protected

  def comment_params
    comment_params = params[:comment]
    comment_params.permit(:name, :email, :comments) if comment_params
  end
end
