class PublicController < ApplicationController

  layout 'public'

  def index
    #intro_text
  end

  def show
    @page = Page.where(:permalink =>  params[:permalink], :visible => true).first
    if @page.nill?
      redirect_to(:action => 'index')
    else
      #display the page content using show.html.erb

    end
  end
end
