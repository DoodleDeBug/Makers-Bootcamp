require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/birthday.rb'
require 'date'



class Greeter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/birthday' do

    session[:name] = params[:name]

    @day = params[:day].to_i
    @month = params[:month].to_i

    @countdown = Birthday.new(@day, @month).calculate(Date.today)

    session[:countdown] = @countdown

    unless @countdown == 0 then 
      redirect('/countdown')
    end

    erb(:birthday)
  
  end

  get '/countdown' do
    @name = session[:name]
    @countdown =  session[:countdown]
    erb(:countdown)
  end


end
# http://localhost:9292