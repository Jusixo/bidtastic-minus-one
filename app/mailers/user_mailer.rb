class UserMailer < ApplicationMailer
  default from: 'notifications@bidtastic.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Bidtastic.')
  end
end
