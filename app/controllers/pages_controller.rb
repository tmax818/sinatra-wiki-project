class PagesController < ApplicationController
enable :sessions
############## create (Crud) ################

#Render the form for creating a new page
get '/pages/new' do
    erb :'pages/new'
end

#Create a new page
post '/pages' do
  @page = Page.new(params)
  @page.save
  redirect "/pages/#{@page.id}"
end

############ read (cRud) #############
#Show a single page
get '/pages/:id' do
  @page = Page.find(params[:id])
  puts params
  erb :'pages/index'
end
#Show all pages
get '/pages' do
  @user = User.find(session[:id])
  #binding.pry
  erb :'pages/show'
end


################# update (crUd) #############
#Render the form for editing a page
get '/pages/:id/edit' do
  @page = Page.find(params[:id])
  #binding.pry
  erb :'pages/edit'
end
#Update a page
patch '/pages/:id' do
  @page = Page.find(params[:id])
  #binding.pry
  @page.update(content: params[:content], title: params[:title])
  flash[:message] = "Page edited."
  redirect "/pages/#{@page.user_id}"
end

########### delete (cruD) #############
#Delete a page
delete '/pages/:id' do
  @page = Page.find(params[:id])
  i = @page.user_id
  @page.destroy
  flash[:message] = "Page deleted."
  redirect "/pages/#{i}"
end

########### helpers ####################

helpers do
  def logged_in?
    !!session[:id]
  end

  def current_user
    User.find(session[:id])
  end
end
end
