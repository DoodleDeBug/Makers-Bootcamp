require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb(:index)
end

post '/birthday-msg' do
  p params
  @name = params[:name]
  @day = params[:day]
  @month = params[:month]
  
  erb(:birthday)
end

# http://localhost:4567