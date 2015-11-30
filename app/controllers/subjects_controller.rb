class SubjectsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject =Subject.new(subject_params)
    if @subject.save
      flash[:notice] = 'Subject was created successufully.'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count + 1
  end

  def update
    @subject =Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = 'Subject was updated successufully.'
      redirect_to(:action => 'show', :id => @subject.id)
    else
      @subject_count = Subject.count +1
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' was destroyed successufully."
    redirect_to(:action => 'index')
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end

end
