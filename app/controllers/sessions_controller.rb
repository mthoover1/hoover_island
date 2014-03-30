class SessionsController < ApplicationController
  def new
  end

  def create
    @person = Person.find_by_email(params[:session][:email])

    if @person && @person.authenticate(params[:session][:password])
      session[:person_id] = @person.id
      redirect_to root_url
    else
      redirect_to login_url, alert: "Invalid email/password combination"
    end
  end

  def destroy
    session.clear
    redirect_to root_path, alert: "Logged out"
  end
end
