class PagesController < ApplicationController

  def handle_404
    if !request.format.html?
      render json: {}, status: 404
      return
    end
  end

  def front_page
  end

  def about
  end

  def retailers
  end

  def success
  end
end
