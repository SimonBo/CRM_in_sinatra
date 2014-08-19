require 'sinatra'

get '/' do
  @school = 'Bitmaker Labs'
  erb :index
end

get '/hi' do
  "Hello world!"
end

get '/:name' do
  "Hello #{params['name'].capitalize}!"
end