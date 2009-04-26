require 'rubygems'
require 'sinatra'

set :environment, :development

get '/' do
  erb :index
end