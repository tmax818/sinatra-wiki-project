class PagesController < ApplicationController
enable :sessions
############## create (Crud) ################

get '/pages/:id/new' do
  @user = User.find(params[:id])
    erb :'pages/new'
end

post '/pages/:id' do
  @user = User.find(params[:id])
  @page = Page.new(title: params[:title], content: params[:content], user_id: params[:id])
  @page.save
  redirect "/pages/#{@user.id}"
end

############ read (cRud) #############

get '/pages/:id' do
  @user = User.find(params[:id])
  puts params
  erb :'pages/index'
end


################# update (crUd) #############

get '/pages/:id/edit' do
  @page = Page.find(params[:id])
  #binding.pry
  erb :'pages/edit'
end

patch '/pages/:id/edit' do
  @page = Page.find(params[:id])
  #binding.pry
  @page.update(content: params[:content], title: params[:title])
  flash[:message] = "Page edited."
  redirect "/pages/#{@page.user_id}"
end

########### delete (cruD) #############

delete '/pages/:id/delete' do
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
