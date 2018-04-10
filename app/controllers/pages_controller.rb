class PagesController < ApplicationController

###### create (Crud) ########

#Render the form for creating a new page
get '/pages/new' do
    erb :'pages/new'
end

#Create a new page
post '/pages' do
  @page = Page.new(params)
  @page.user_id = session[:id]
  @wiki = @page.wiki_wordify
  if @page.save
  redirect "/pages"
else
  flash[:message] = "must have unique title."
  redirect "/pages"
end
end

############ read (cRud) #############
#Show a single page
get '/pages/:id' do
  @page = Page.find(params[:id])
  erb :'pages/show'
end
#Show all pages
get '/pages' do
  @user = User.find(session[:id])
  erb :'pages/index'
end


############ update (crUd) #############
#Render the form for editing a page
get '/pages/:id/edit' do
  @page = Page.find(params[:id])
if logged_in? && current_user.id == @page.user_id
  erb :'pages/edit'
else
  redirect "/users/login"
end

end
#Update a page
patch '/pages/:id' do
  @page = Page.find(params[:id])
  @page.update(content: params[:content], title: params[:title])
  flash[:message] = "Page edited."
  redirect "/pages"
end

########### delete (cruD) #############
#Delete a page
delete '/pages/:id' do
  @page = Page.find(params[:id])
  i = @page.user_id
  @page.destroy
  flash[:message] = "Page deleted."
  redirect "/pages"
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
