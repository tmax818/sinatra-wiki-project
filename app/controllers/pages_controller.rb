class PagesController < ApplicationController
enable :sessions
############## create and read?? ################

get '/pages/:id/new' do
  @user = User.find(params[:id])
    erb :'pages/new'
end

post '/pages/:id' do
  @user = User.find(params[:id])
  @page = Page.new(title: params[:title], content: params[:content], user_id: params[:id])
  @page.save
  erb :'pages/show'
end

################# update crUd #############

get '/pages/:id/edit' do
  @page = Page.find(params[:id])
  #binding.pry
  erb :'pages/edit'
end

patch '/pages/:id/edit' do
  @page = Page.find(params[:id])
  @page.update(content: params[:content], title: params[:title])
  binding.pry
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
