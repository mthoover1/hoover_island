class PersonMailer < ActionMailer::Base
  default from: "hoover.island@gmail.com"

  def forgot_password(account)
    @person = account.person
    @url = calendar_path #make this url eventually
    mail(to: account.email, subject: 'Hoover Island Password Reset')
  end

  def new_season(email)
    @year = Date.today.year
    @url = new_reservation_request_path #make this url eventually
    mail(to: email, subject: "Now Accepting #{@year} Island Reservations")
  end
end
