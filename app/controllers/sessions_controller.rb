class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists and the password entered is correct
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie.
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to '/', notice: 'Signed Out!'
  end

end
