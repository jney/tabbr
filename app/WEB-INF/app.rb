require 'rubygems'
require 'sinatra'
require 'twitter'

set :environment, :development

enable :sessions

get "/" do
	redirect "/home"
end

get "/home" do
	erb :home	
end

post "/login" do
	session["login"] = params["login"]
	session["pwd"] = params["pwd"]
	redirect "/timeline"
end

get "/timeline" do
	timeline = []
	httpauth = Twitter::HTTPAuth.new(session["login"],session["pwd"])
	client = Twitter::Base.new(httpauth)
	request.params["friends_timeline"] = client.friends_timeline
	erb :timeline
end

post "/tweet" do
	httpauth = Twitter::HTTPAuth.new(session["login"],session["pwd"])
	client = Twitter::Base.new(httpauth)
	client.update(params["tweet"])
	redirect "/timeline"
end