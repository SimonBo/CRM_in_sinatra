require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new   #class variable, lives for the intirety of the program, doesnt reset itself
@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

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

get '/contacts/find' do
  erb :find_contact
end

post '/contacts/find' do
  @contact = @@rolodex.find_contact(params['last_name'])
  if @contact
    erb :show_contact
  else
    erb :contacts
  end
end

get "/contacts/:id/edit" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end



get "/contacts/:id/edit" do
  erb :edit_contact
end

put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end



post '/contacts' do
  contact=Contact.new(params['first_name'], params['last_name'], params['email'], params['notes'])
  @@rolodex.add_contact(contact)
  redirect to ('/contacts')
end

delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.delete_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end
