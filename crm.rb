require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new   #class variable, lives for the intirety of the program, doesnt reset itself

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  contact=Contact.new(params['first_name'], params['last_name'], params['email'], params['notes'])
  @@rolodex.add_contact(contact)
  redirect to ('/contacts')
end