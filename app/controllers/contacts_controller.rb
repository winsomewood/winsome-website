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
      client = Aws::S3::Client.new(
        access_key_id: 'UOQFX6JP4UGYEIIPPB7U',
        secret_access_key: ENV['DIGITALOCEAN_SPACES_SECRET_KEY'],
        endpoint: 'https://sfo3.digitaloceanspaces.com',
        region: 'us-east-1'
      )

      client.put_object(
        bucket: "form-submissions",
        key: "#{Rails.env}/comments/#{Time.now.strftime("%Y-%m-%d_%H%M_%S%L")}-#{@comment.name[0..2]}.txt",
        body: ActionController::Base.new().render_to_string(template: 'contacts/form_submission', locals: {comment: @comment})
      )

      redirect_to success_path
    else
      render 'show'
    end
  end

  protected

  def comment_params
    comment_params = params[:comment]
    comment_params.permit(:subject, :name, :company, :email, :comments) if comment_params
  end
end
