
class UsersController < ApplicationController


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
       redirect '/users/signup'
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
      redirect "/users"
    else
       flash[:message] = "Please enter a valid username and password."
      redirect "/users/login"
    end
  end

  ########## logout #########

  get '/users/logout' do
     if logged_in?
      session.clear
      flash[:message] = "You've been logged out. Please enter a valid username and password."
      redirect 'users/login'
     else
       redirect '/'
     end
   end

############# homepage ###########

get '/users' do
  erb :'users/show'
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
