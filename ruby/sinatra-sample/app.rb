require 'sinatra/base'
require 'haml'
load 'lib/sample.rb'

class App < Sinatra::Base
  set :haml, :format => :html5

  get '/' do
    haml :index
  end

  get '/datetime' do
    s = Sample.new
    @current = s.current
    @utc = s.utc
    haml :date_time
  end
end

