require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb(:index)
end

# http://localhost:4567