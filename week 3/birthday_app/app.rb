require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/birthday.rb'


class Greeter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/birthday' do

    @name = params[:name]

    @day = params[:day]
    @month = params[:month]

    @countdown = Birthday.new(@day, @month).calculate

    unless @countdown == 0 then 
      redirect('/countdown') 
    end

    erb(:birthday)
  
  end

  get '/countdown' do

    erb(:countdown)
  end


end
# http://localhost:9292