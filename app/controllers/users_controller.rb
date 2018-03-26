class UsersController < ApplicationController
  enable :sessions
  use Rack::Flash

  ############### login ################

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if @user and @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/pages/#{@user.id}"
    else
       flash[:message] = "Please enter username and password."
      redirect "/users/login"
    end
  end

############ signup ###########

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users/signup' do
    @user = User.new(params)
     if @user.save
       session[:id] = @user.id
       redirect "/users/login"
     else
    flash[:message] = "You must enter a valid username, email, and password!"
     redirect "/users/signup"
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
