class PageController < ApplicationController

  get '/new' do
  erb :'pages/new'
end

post '/new' do
  binding.pry
end

get '/:title' do
  erb :'pages/show'
end

get '/:title/edit' do
  @title = params[:title]
  @content = page_content(@title)
  erb :edit
end

put '/:title' do

end

delete '/:title' do
  redirect '/'
end

end
