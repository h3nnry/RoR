class DemoController < ApplicationController

  layout 'application'

  def index
    @array = ['Jora', 'Borea', 'Kolea']
    render(:template => 'demo/index')
  end

  def hello
    @id = params['id'].to_i
    @page = params[:page].to_i
  end

  def other_hello
    redirect_to(:controller=>'demo', ':action'=>'index')
  end

  def text_helpers
    
  end

  def number_helpers
    
  end

  def date_helpers
    
  end

  def escape_string

  end

end
