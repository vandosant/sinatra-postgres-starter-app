require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index
  end

  get '/artists' do
    erb :artists, locals: {:artists => DB[:artists]}
  end

  get '/artists/new' do
    erb :new
  end

  post '/artists' do
    DB[:artists].insert(:name => params[:name])
    redirect '/artists'
  end
end