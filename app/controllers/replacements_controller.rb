class ReplacementsController < ApplicationController

  before_action :set_page_title
  before_action :set_replacement

  def set_page_title
    @page_title = "Replacement Request"
  end

  def set_replacement
    @replacement = Replacement.new(replacement_params)
  end

  def show
  end

  def create
    if @replacement.valid?
      InfoMailer.replacement_email(@replacement).deliver_now
      redirect_to success_path
    else
      render 'show'
    end
  end

  def render_email
    # test url:
    # http://localhost:3000/contact/replacement/render_email?replacement[name]=123&replacement[address1]=hi&replacement[comments]=this%20is%20great&replacement[send_full_hardware_set]=1&parts[letter][0]=12&parts[letter][1]=31&parts[name][0]=12&parts[name][1]=31&parts[quantity][0]=12&parts[quantity][1]=31&parts[reason][0]=12&parts[reason][1]=31
    @replacement = Replacement.new(replacement_params)
    render :file => 'info_mailer/replacement_email.html.haml', :layout => 'mailer'
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
      :comments,
      :send_full_hardware_set
    ).merge(parts: assemble_parts(params[:parts])) if replacement_params
  end

  # Grab all the `parts` params and join them all into a string
  def assemble_parts(parts)
    return parts ? parts.to_json : nil
  end

end
