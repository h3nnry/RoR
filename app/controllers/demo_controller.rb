class DemoController < ApplicationController

  layout false

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
end
