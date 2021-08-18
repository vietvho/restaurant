class UserMailer < ApplicationMailer
    default from: 'vnbillio@gmail.com'
    @subject = 'Welcome to My Awesome Site'
   

    def welcome_email
        @user = params[:user]
        if defined?( params[:email_subject]) 
            @subject = params[:email_subject]
        end
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject:  "Thank you for subject - #{params[:email_subject]}")
    end

    def to_admin
        @user = params[:user]
        @email_subject = params[:email_subject]
        @message = params[:message]
        @url  = 'http://example.com/login'
        mail(to: 'vnbillio@gmail.com', subject:  params[:email_subject])
    end
end
