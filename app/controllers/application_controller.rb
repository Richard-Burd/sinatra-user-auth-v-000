class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    puts params
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    puts params
    @user = User.find_by(email: params["email"], password: params["password"])
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/sessions/logout' do

    redirect '/'
  end

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end

end

=begin 
# This method is from 55:38 / 1:28:48 of this video: https://www.youtube.com/watch?time_continue=2&v=_S1s6R-_wYc

def login(email)
  # check if a user with this email actually exists 
  # if so, set the session 
  if user = User.find_by(:email => email) 
    session[:email] = user.email 
  else 
    redirect '/login' 
  end  
end 



=end 
