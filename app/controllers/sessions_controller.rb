class SessionsController < ApplicationController
  def new
  end

  def create
    @account = Account.find_by_email(params[:session][:email])

    if @account && @account.authenticate(params[:session][:password])
      session[:person_id] = @account.person.id
      redirect_to root_url
    else
      redirect_to login_url(email: params[:session][:email]), alert: "Invalid email or password"
    end
  end

  def destroy
    session.clear
    redirect_to login_url, alert: "Logged out"
  end

  def password
  end

  def send_password_email
    account = Account.find_by_email(params[:session][:email])

    if account
      PersonMailer.forgot_password(account).deliver
      redirect_to login_url, alert: "Password reset email sent"
    else
      redirect_to forgot_password_url, alert: "Email address not found"
    end
  end
end
