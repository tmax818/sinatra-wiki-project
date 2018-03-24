class UsersController < ApplicationController
use Rack::Flash
################ signup #####################

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users/signup' do
    @user = User.new(params)
     if @user.save
       redirect '/users/login'
     else
       flash[:message] = "Successfully created song."
       redirect "/users/signup"
     end
    binding.pry
  end

  ############### login ########################3

  get "/users/login" do
    "user.login"
  end



end
