require 'rubygems'
require 'sinatra'

set :environment, :development

helpers do
  def clickable_menu
    @_out_buf << '<div class="menu"><span class="arrow"></span><div class="menu-content">'
    yield
    @_out_buf << '</div></div>'
  end
end

get '/' do
  erb :index
end