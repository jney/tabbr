require 'rubygems'
require 'sinatra'
require 'twitter'

set :environment, :development

enable :sessions

get "/" do
	if(session["base"].nil?)
		redirect "/home"
	else
		redirect "/timeline"
	end
end

get "/home" do
	erb :home	
end

post "/login" do
	httpauth = Twitter::HTTPAuth.new(params["login"],params["pwd"])
	session["base"] = Twitter::Base.new(httpauth)	
	redirect "/timeline"
end

get "/timeline" do
	timeline = []
	request.params["friends_timeline"] = session["base"].friends_timeline
	erb :timeline
end

post "/tweet" do
	session["base"].update(params["tweet"])
	redirect "/timeline"
end