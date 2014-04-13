class PersonMailer < ActionMailer::Base
  default from: "hoover.island@gmail.com"

  def forgot_password(person)
    @person = person
    @url = calendar_path
    mail(to: @person.email, subject: 'Hoover Island Password Reset')
  end
end
