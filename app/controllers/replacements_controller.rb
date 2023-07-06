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
      replacements_home = "/home/replacements/"
      replacements_json_directory = File.join("#{replacements_home}","json")
      logFile = File.join("#{replacements_home}", "replacements.log")

      logger = Logger.new(logFile)

      # Only sends in prod, see README.md's "Environments and their differences"
      InfoMailer.replacement_email(@replacement).deliver_now

      json_filename = "request_#{Time.now.strftime("%Y-%m-%d_%H%M_%S%L")}"

      # save attachment to file on server, with same prefix as json file (written below)
      if @replacement.proof_of_purchase
        path = File.join(
          replacements_home,
          "json_attach",
          "#{json_filename}_#{File.basename(@replacement.proof_of_purchase.original_filename).gsub(/\s/,'_')}"
        )
        begin
          File.open(path, "wb") { |f| f.write(@replacement.proof_of_purchase.read) }
        rescue => e
          logger.error "error writing attachment to #{path}"
          logger.error "#{e}"
        end
      end

      if !@replacement.additional_images.empty?
        @replacement.additional_images.each_with_index do |image, i|
          path = File.join(
            replacements_home,
            "json_attach",
            "#{json_filename}_#{i}_#{File.basename(image.original_filename).gsub(/\s/,'_')}"
          )
          begin
            File.open(path, "wb") { |f| f.write(image.read) }
          rescue => e
            logger.error "error writing attachment to #{path}"
            logger.error "#{e}"
          end
        end
      end

      # write email contents to file as json
      begin
        File.write(File.join(
          replacements_home,
          "json",
          "#{json_filename}.json
        "), JSON.generate(@replacement.to_json))
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
    render :file => 'info_mailer/replacement_email.html.erb', :layout => 'mailer'
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
      :send_full_hardware_set,
      :additional_images,
      :additional_images_filenames
    ).merge(parts: assemble_parts(params[:parts])) if replacement_params
  end

  # Grab all the `parts` params and join them all into a string
  def assemble_parts(parts)
    return parts ? parts.to_json : nil
  end

end
