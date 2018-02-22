class UsersController < ApplicationController # This is just me copying from 1:09:00 / 1:28:48 from this video here: https://www.youtube.com/watch?time_continue=2&v=_S1s6R-_wYc
  get 'signup' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :"users/new"
    end
  end
end
