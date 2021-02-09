require 'logger'
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
      replacements_main_directory = "/home/replacements/"
      replacements_json_directory = File.join("#{replacements_main_directory}","json")
      replacements_image_directory = File.join("#{replacements_main_directory}","json_attach")
      logFile = File.join("#{replacements_main_directory}","replacements.log")
      sendEmail = true  #false

      logger = Logger.new(logFile)

      # set to true if want email in development mode
      if Rails.env == 'development'
        sendEmail = false
      end

      if sendEmail
        InfoMailer.replacement_email(@replacement).deliver_now
      end

      t = Time.now
      dateTimeExt = t.strftime("%Y-%m-%d_%H%M_%S%L")
      json_filename = "request_#{dateTimeExt}"

      # save attachment to file on server, with same prefix as json file (written below)
      repl = @replacement
      if repl.proof_of_purchase
        uplImage = File.basename(repl.proof_of_purchase.original_filename)
        uplImage.gsub!(/\s/,'_')
        newImageFile = "#{json_filename}_#{uplImage}"
        path = File.join("#{replacements_image_directory}","#{newImageFile}")
        begin
          File.open(path,"wb") { |f| f.write(repl.proof_of_purchase.read) }
          @replacement.proof_of_purchase_filename = "#{newImageFile}"
        rescue => e
          logger.error "error saving proof of purchase image #{newImageFile}"
          logger.error "#{e}" 
        end          
      end

      # write email contents to file as json
      begin
        replacement_json = @replacement.to_json
        jsonFile = File.join("#{replacements_json_directory}","#{json_filename}.json")
        File.write("#{jsonFile}", JSON.generate(replacement_json))
      rescue => e
        logger.error "error writing #{json_filename}.json"
        logger.error "#{e}"
      end
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
