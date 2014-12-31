class ContactsController < ApplicationController

  before_filter :set_comment

  def set_comment
    @comment = Comment.new(comment_params)
  end

  def new
    @page_title = "Contact Us"
  end

  def create
    if @comment.save
      redirect_to success_path
    else
      render 'new'
    end
  end

  protected

  def comment_params
    comment_params = params[:comment]
    comment_params.permit(:name, :email, :comments) if comment_params
  end
end
