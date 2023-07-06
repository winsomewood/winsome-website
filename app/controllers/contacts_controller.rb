class ContactsController < ApplicationController

  before_action :set_page_title
  before_action :set_comment

  def set_page_title
    @page_title = "Contact us"
  end

  def set_comment
    @comment = Comment.new(comment_params)
  end

  def show
  end

  def create
    if @comment.valid?
      # Only sends in prod, see README.md's "Environments and their differences"
      InfoMailer.comments_email(@comment).deliver_now
      redirect_to success_path
    else
      render 'show'
    end
  end

  protected

  def comment_params
    comment_params = params[:comment]
    comment_params.permit(:subject, :name, :company, :email, :item_number, :control_number, :comments) if comment_params
  end
end
