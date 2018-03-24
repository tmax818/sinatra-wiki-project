class UsersController < ApplicationController
use Rack::Flash
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
       puts "you fucked up"
     redirect "/users/signup"
   end
  end

  ############### login ########################

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
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
