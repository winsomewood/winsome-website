class PagesController < ApplicationController

  before_filter :render_template

  def front_page
  end

  def find
  end

  def success
  end

  protected

  def render_template
    @page = Page.find_by_slug(params[:action])
    template_binding = binding
    eval("url_helpers = Rails.application.routes.url_helpers", template_binding)
    render :inline => Haml::Engine.new(@page.content).render(template_binding), :layout => true
  end
end
