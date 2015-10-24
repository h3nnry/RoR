class PagesController < ApplicationController

  layout false

  def index
    @pages = Page.sorted
    # @pages = Page.find(:all, :include => :subject, :order => "created_at DESC")
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @subjects = Subject.all
  end

  def create
    @page =Page.new(page_params)
    if @page.save
      flash[:notice] = 'Page was created successufully.'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.all
  end

  def update
    @page =Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = 'Page was updated successufully.'
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' was destroyed successufully."
    redirect_to(:action => 'index')
  end

  private
  def page_params
    params.require(:page).permit(:name, :subject_id, :permalink, :position, :visible)
  end

end
