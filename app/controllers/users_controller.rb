require 'rack-flash'

class UsersController < ApplicationController
  # enable :sessions
  # use Rack::Flash
################ signup #####################

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users/signup' do
    @user = User.new(params)
     if @user.save
       session[:id] = @user.id
       erb :'users/test'
     else
     flash[:message] = "Successfully created song."
     redirect "/users/signup"
     puts flash[:message]
   end
  end

  ############### login ################

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])

    if @user and @user.authenticate(params[:password])
      session[:id] = @user.id
      erb :"/users/test"
    else
      redirect "/users/login"
    binding.pry
    end
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
