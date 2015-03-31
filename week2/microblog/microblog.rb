require 'rubygems'
require 'sinatra'
require 'haml'
require './model/blog.rb' 

db = Blog.new()

get '/' do
    puts db.is_empty?
    #haml '%h1 Sorry, you don\'t have posts.'
	  @posts = db.posts.reverse
	  haml :index  
end

get '/post/:id' do
	@post = db.post(params[:id])
	haml :blogpost
end

get '/new' do
	haml :blogform
end

post '/new' do
	id = db.new_post(params[:title], params[:body])
	redirect "/"
end

delete '/post/:id' do
  db.delete(params[:id])
  redirect "/"
end
