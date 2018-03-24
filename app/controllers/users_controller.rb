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
       else
         redirect '/users/signup'
       end

  end

  ############### login ########################

  get "/users/login" do
    "user.login"
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
