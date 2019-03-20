require 'sinatra/base'
require 'haml'
load 'lib/sample.rb'

class App < Sinatra::Base
  set :haml, :format => :html5

  get '/' do
    haml :index
  end

  get '/date' do
    @datetime = Sample.new.date_time.to_s
    haml :date_time
  end
end

