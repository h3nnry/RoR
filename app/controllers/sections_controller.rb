class SectionsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section_count = Section.count + 1
    @pages = Page.all
  end

  def create
    @section =Section.new(section_params)
    if @section.save
      flash[:notice] = 'Section was created successufully.'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.all
    @section_count = Section.count + 1
  end

  def update
    @section =Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = 'Section was updated successufully.'
      redirect_to(:action => 'show', :id => @section.id)
    else
      @section_counr = Section.count + 1
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' was destroyed successufully."
    redirect_to(:action => 'index')
  end

  private
  def section_params
    params.require(:section).permit(:name, :page_id, :content_type, :content, :position, :visible)
  end

end
