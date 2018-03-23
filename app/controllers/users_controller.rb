class UsersController < ApplicationController



  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users/signup' do
    #binding.pry
  end

  get "/users/login" do
    "user.login"
  end



end
