require 'logger'
class ReplacementsController < ApplicationController

  before_action :set_page_title
  before_action :set_replacement

  def set_page_title
    @page_title = "Replacement request"
  end

  def set_replacement
    @replacement = Replacement.new(replacement_params)
  end

  def show
  end

  def create
    if @replacement.valid?
      client = Aws::S3::Client.new(
        access_key_id: 'UOQFX6JP4UGYEIIPPB7U',
        secret_access_key: ENV['DIGITALOCEAN_SPACES_SECRET_KEY'],
        endpoint: 'https://sfo3.digitaloceanspaces.com',
        region: 'us-east-1'
      )

      client.put_object(
        bucket: "form-submissions",
        key: "#{Rails.env}/replacements/json/#{Time.now.strftime("%Y-%m-%d_%H%M_%S%L")}.json",
        body: ActionController::Base.new().render_to_string(template: 'replacements/form_submission', locals: {replacement: @replacement})
      )

      if @replacement.proof_of_purchase
        client.put_object(
          bucket: "form-submissions",
          key: "#{Rails.env}/replacements/json_attach/#{Time.now.strftime("%Y-%m-%d_%H%M_%S%L")}_#{File.basename(@replacement.proof_of_purchase.original_filename).gsub!(/\s/,'_')}",
          body: @replacement.proof_of_purchase.read
        )
      end

      redirect_to success_path
    else
      render 'show'
    end
  end

  protected

  def replacement_params
    replacement_params = params[:replacement]
    replacement_params.permit(:name,
      :address1,
      :address2,
      :address_type,
      :city,
      :state,
      :zip,
      :phone,
      :email,
      :purchase_date,
      :retailer,
      :controlno,
      :itemno,
      :r,
      :description,
      :proof_of_purchase,
      :proof_of_purchase_filename,
      :comments,
      :send_full_hardware_set
    ).merge(parts: assemble_parts(params[:parts])) if replacement_params
  end

  # Grab all the `parts` params and join them all into a string
  def assemble_parts(parts)
    return parts ? parts.to_json : nil
  end

end
