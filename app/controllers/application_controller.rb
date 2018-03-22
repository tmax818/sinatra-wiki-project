require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/new' do
  erb :new
end

post '/new' do

end

get '/:title' do
  erb :show
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
