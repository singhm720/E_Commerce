class UserMailer < ApplicationMailer
    
    def welcome_email(user)
      mail(to: user, subject: 'Welcome to our site')
    end

    def verification_email(user)
        @user = user
        mail(to: @user.email, subject: 'Email Verification')
      end
  end