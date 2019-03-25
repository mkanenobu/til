require 'sinatra/base'
require 'haml'
require 'json'
$LOAD_PATH << 'lib'

class App < Sinatra::Base
  set :haml, :format => :html5

  get '/' do
    haml :index
  end

  get '/datetime' do
    load 'sample.rb'
    s = Sample.new
    @current = s.current
    @utc = s.utc
    haml :date_time
  end

  post '/rot13' do
    load 'rot13.rb'
    params = JSON.parse(request.body.read, { :symbolize_names => true })
    Rot13.new(params[:paragraph]).to_s
  end
end

