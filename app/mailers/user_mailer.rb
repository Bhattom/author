class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email
        attachments_inline['images.jpeg'] = File.read('/assets/images/images.jpeg')
      @user = params[:user]
      @url  = 'http://example.com/login'

      mail(to: @user.email, subject: 'Welcome to The Book Portal')
    end
end
