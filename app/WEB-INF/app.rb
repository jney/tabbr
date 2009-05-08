require 'rubygems'
require 'sinatra'
require 'twitter'

set :environment, :development

enable :sessions

helpers do
  def add_links(txt)
    txt.
      gsub(/(http:\/\/\S+)/, '<a href="http://\1" onclick="target=\"_blank\"">\1</a>').
      gsub(/@([a-zA-Z0-9_]+)/, '@<a href="http://twitter.com/\1" onclick="target=\"_blank\"">\1</a>').
      gsub(/#(\S+)/, '#<a href="http://search.twitter.com/search?q=\1" onclick="target=\"_blank\"">\1</a>')
  end
end

before do
	if(!["/login", "/connect"].include? request.path_info )
		if(session["base"].nil? || session["base"] == {})
			redirect "/login"
		end	
	end
end

get "/" do
	redirect "/timeline"
end

get "/login" do
	erb :login	
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