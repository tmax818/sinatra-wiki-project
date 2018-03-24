class PagesController < ApplicationController

get '/pages/new' do
  erb :'pages/new'
end

post '/pages' do
  binding.pry
end

end
