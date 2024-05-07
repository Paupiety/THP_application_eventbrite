class UserMailer < ApplicationMailer
    default from: ENV['MAILJET_DEFAULT_FROM']

def welcome_email(user)
    @user = user
    @url = "http://eventbrite.fr/login"
    mail(to: @user.email, subject: "Bienvenue chez Eventbrite !")
end

def welcome_attendance(attendance)
    @attendance = attendance
    @url = "http://eventbrite.fr/adefinir"
    mail(to: @attendance.user.email, subject: "Confirmation de participation")
end

end
