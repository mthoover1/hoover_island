class PersonMailer < ActionMailer::Base
  default from: "hoover.island@gmail.com"

  def forgot_password(account)
    @person = account.person
    @url = calendar_path
    mail(to: account.email, subject: 'Hoover Island Password Reset')
  end
end
