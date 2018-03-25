class PagesController < ApplicationController
enable :sessions
############## create ################

get '/pages/:id/new' do
  @user = User.find(params[:id])
    erb :'pages/new'
end

post '/pages/:id' do
  @user = User.find(params[:id])
  @page = Page.new(title: params[:title], content: params[:content], user_id: params[:id])
  @page.save
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
